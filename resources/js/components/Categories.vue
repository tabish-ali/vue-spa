<template>
    <div class="w-100">
        <div class="w-100 p-2 d-flex">
            <button
                :disabled="!selectedCategories.length > 0"
                class="btn-sm btn-danger btn"
                @click="deleteCategories"
            >
                Delete
            </button>
            <input
                v-model="newCategory"
                type="text"
                class="form-control ml-2"
                placeholder="Add new category..."
            />
            <button
                style="width:100px"
                class="btn-sm btn-success ml-2 btn"
                @click="addCategory"
            >
                <svg
                    style="width:20px; height:20px"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
                    />
                </svg>
            </button>
        </div>
        <div class="">
            <table class="table h-100 bg-white w-100 overflow-x-scroll">
                <thead class="table-head text-uppercase">
                    <tr>
                        <th scope="col">
                            <input
                                type="checkbox"
                                v-model="allSelected"
                                @click="selectAll"
                            />
                        </th>
                        <th scope="col">Name</th>
                        <th scope="col">Date</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody class="table-body">
                    <tr
                        v-for="(category, index) in categories.data"
                        :key="category.id"
                    >
                        <th scope="row">
                            <input
                                type="checkbox"
                                @click="pushSelected($event, category)"
                                v-model="category.selected"
                            />
                        </th>
                        <td class="align-middle">{{ category.text }}</td>
                        <td class="align-middle">{{ category.created_at }}</td>
                        <td>
                            <span class="border p-1 del-icon">
                                <svg
                                    @click="deleteSingle(category, index)"
                                    class="icons"
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                                    />
                                </svg>
                            </span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center mb-5">
            <pagination
                :data="categories"
                @pagination-change-page="getResults"
            ></pagination>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            categories: {},
            selectedCategories: [],
            allSelected: false,
            newCategory: '',
        }
    },
    mounted() {
        document.body.style.overflow = 'hidden'
        this.getResults()
    },
    methods: {
        async getResults(page = 1) {
            const response = await axios.get('api/get-categories/?page=' + page)
            this.categories = response.data
        },

        async addCategory() {
            if (this.newCategory) {
                const obj = this
                const response = await axios
                    .post('api/add-category/', { category: this.newCategory })
                    .catch(function(error) {
                        console.log(error)
                    })
                    .then(function() {
                        obj.$toasted.show('New category created !!', {
                            type: 'success',
                            position: 'top-center',
                            duration: 5000,
                        })
                        obj.getResults()
                    })
            } else {
                this.$toasted.show('Please give category a valid name!', {
                    type: 'error',
                    position: 'top-center',
                    duration: 5000,
                })
            }
        },

        editcategory(category) {
            this.$emit('editcategory', category)
        },

        pushSelected($event, category) {
            if ($event.target.checked) {
                this.selectedCategories.push(category)
                console.log(this.selectedCategories.length)
                category.select = true
            } else {
                this.selectedCategories.pop(category)
                category.select = false
            }
        },

        selectAll() {
            this.allSelected = !this.allSelected
            this.categories.data.forEach(category => {
                category.selected = this.allSelected

                if (category.selected) this.selectedCategories.push(category)
                else this.selectedCategories.pop(category)
            })
        },

        deleteSingle(category, index) {
            this.$toasted.show('Do you want to delete selected category?', {
                position: 'top-center',
                action: [
                    {
                        text: 'Cancel',
                        onClick: (e, toastObj) => {
                            toastObj.goAway(0)
                            return
                        },
                    },
                    {
                        text: 'Proceed',
                        onClick: (e, toastObj) => {
                            toastObj.goAway(0)
                            this.categories.data.splice(index, 1)

                            this.deleteCategory(category)
                        },
                    },
                ],
            })
        },
        deleteCategories() {
            if (this.selectedCategories.length) {
                this.$toasted.show(
                    'Do you want to delete selected categories?',
                    {
                        position: 'top-center',
                        action: [
                            {
                                text: 'Cancel',
                                onClick: (e, toastObj) => {
                                    toastObj.goAway(0)
                                    return
                                },
                            },
                            {
                                text: 'Proceed',
                                onClick: (e, toastObj) => {
                                    toastObj.goAway(0)
                                    this.deleteSelected()
                                },
                            },
                        ],
                    }
                )
            }
        },
        async deleteCategory(category) {
            console.log(category)
            const obj = this
            const response = await axios
                .post('api/delete-category/', {
                    id: category.id,
                })
                .catch(function(error) {
                    console.log(error)
                })
                .then(function() {
                    obj.$toasted.show('Deleted !!', {
                        type: 'primary',
                        position: 'top-center',
                        duration: 5000,
                    })
                })
        },

        async deleteSelected() {
            const obj = this
            const response = await axios
                .post('api/delete-categories/', {
                    categories: this.selectedCategories,
                })
                .catch(function(error) {
                    console.log(error)
                })
                .then(function() {
                    obj.$toasted.show('Deleted !!', {
                        type: 'secondary',
                        position: 'top-center',
                        duration: 5000,
                    })
                    obj.getResults()
                    obj.allSelected = false
                })
        },
    },
}
</script>

<style></style>
