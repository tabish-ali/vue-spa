<template>
    <div class="w-100 overflow-scroll">
        <div class="w-100 p-2">
            <button class="btn-sm btn-danger btn">Delete</button>
        </div>
        <table class="table table-striped w-100 overflow-y-scroll">
            <thead>
                <tr>
                    <th scope="col">
                        <input type="checkbox" />
                    </th>
                    <th scope="col">Title</th>
                    <th scope="col">Date</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="article in articles.data" :key="article.id">
                    <th scope="row">
                        <input
                            type="checkbox"
                            @click="pushSelected($event, article)"
                        />
                    </th>
                    <td>{{ article.title }}</td>
                    <td>{{ article.created_at }}</td>
                    <td>
                        <button class="btn btn-sm btn-primary">
                            <svg
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
                                    d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                />
                            </svg>
                        </button>
                        <button class="btn btn-sm btn-danger">
                            <svg
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
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-center">
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
                this.selectedArticles.push(article.id)
            } else {
                this.selectedArticles.pop(article.id)
            }
            console.log(this.selectedArticles)
        },

        deleteSelected() {},
    },
}
</script>

<style>
.icons {
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
