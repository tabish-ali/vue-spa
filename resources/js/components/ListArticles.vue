<template>
    <div class="w-100">
        <div class="w-100 p-2">
            <button class="btn-sm btn-danger btn" @click="deleteSelected">
                Delete
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
                        <th scope="col">Title</th>
                        <th scope="col">Date</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody class="table-body">
                    <tr
                        v-for="(article, index) in articles.data"
                        :key="article.id"
                    >
                        <th scope="row">
                            <input
                                type="checkbox"
                                @click="pushSelected($event, article)"
                                v-model="article.selected"
                            />
                        </th>
                        <td class="align-middle">{{ article.title }}</td>
                        <td class="align-middle">{{ article.created_at }}</td>
                        <td>
                            <span class="border p-1 edit-icon">
                                <svg
                                    class="icons "
                                    xmlns="http://www.w3.org/2000/svg"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                >
                                    <path
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                    />
                                </svg>
                            </span>

                            <span class="border p-1 del-icon">
                                <svg
                                    @click="deleteSingle(article, index)"
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
                :data="articles"
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
            articles: {},
            selectedArticles: [],
            allSelected: false,
        }
    },
    mounted() {
        document.body.style.overflow = 'hidden'
        this.getResults()
    },
    methods: {
        async getResults(page = 1) {
            const response = await axios.get('api/get-articles/?page=' + page)
            this.articles = response.data
        },

        pushSelected($event, article) {
            if ($event.target.checked) {
                this.selectedArticles.push(article)
                article.select = true
            } else {
                this.selectedArticles.pop(article)
                article.select = false
            }
        },

        selectAll() {
            this.allSelected = !this.allSelected
            this.articles.data.forEach(article => {
                article.selected = this.allSelected

                if (article.selected) this.selectedArticles.push(article)
                else this.selectedArticles.pop(article)
            })
        },

        deleteSingle(article, index) {
            this.$toasted.show('Do you want to delete selected articles?', {
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
                            this.articles.data.splice(index, 1)

                            this.deleteArticle(article)
                        },
                    },
                ],
            })
        },
        async deleteArticle(article) {
            console.log(article)
            const obj = this
            const response = await axios
                .post('api/delete-article/', {
                    id: article.id,
                })
                .catch(function(error) {
                    console.log(error)
                })
                .then(function() {
                    obj.$toasted.show('Deleted !!', {
                        type: 'primary',
                        position: 'top-right',
                        duration: 5000,
                    })
                })
        },
        async deleteSelected() {
            if (this.selectedArticles.length) {
                const obj = this
                const response = await axios
                    .post('api/delete-articles/', {
                        articles: this.selectedArticles,
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
            }
        },
    },
}
</script>

<style>
.table-head {
    color: #575757;
    font-size: 14px;
    letter-spacing: 1px;
}
.table-body {
    color: #656565;
    font-size: 14px;
}
.del-icon {
    color: red;
    border-radius: 4px;
    background: rgb(255, 147, 147);
}
.edit-icon {
    color: rgb(20, 102, 255);
    border-radius: 4px;
    background: rgb(147, 190, 255);
}
.icons {
    cursor: pointer;
    height: 20px;
    width: 20px;
}
.page-link {
    display: inline-block;
}
.page-link {
    font-size: 20px;
    color: #29b3ed;
    font-weight: 500;
}
.offset {
    width: 500px !important;
    margin: 20px auto;
}
</style>
