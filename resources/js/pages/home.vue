<template>
    <div class="container" ref="home">
        <!-- <card :title="$t('home')">
      {{ $t("you_are_logged_in") }}
      <div class="d-flex justify-content-center">
        <router-link class="btn btn-dark" :to="{ name: 'admin.dashboard' }">
          {{ $t("dashboard") }}
        </router-link>
      </div>
    </card> -->
        <div class="mt-4">
            <div class="card">
                <div class="card-header">
                    Articles
                </div>
                <div class="card-body">
                    <div
                        class="row py-2 border-bottom mb-2 py-1 px-3"
                        v-for="article in articles"
                        :key="article.id"
                    >
                        <div class="d-flex">
                            <a :href="article.youtube_link" target="__blank">
                                <img
                                    class="thumbnail"
                                    :src="article.youtube_img"
                                    alt=""
                                />
                            </a>
                        </div>
                        <div class="d-flex flex-grow-1 flex-column ml-md-4">
                            <div
                                class="title-container mt-2 my-md-0 d-flex items-start"
                            >
                                <h6 @click="showArticle(article)">
                                    {{ article.title.substr(0, 50) }}...
                                </h6>

                                <!-- <router-link
                                    :to="{
                                        name: 'article',
                                        params: { shownArticle: article },
                                    }"
                                >
                                    <h6>
                                        {{ article.title.substr(0, 50) }}...
                                    </h6>
                                </router-link> -->
                            </div>
                            <div class="d-flex align-items-end h-100">
                                <small
                                    v-for="tag in article.tags_array"
                                    :key="tag"
                                    class="d-inline text-center font-weight-bold tag p-1 rounded mr-1"
                                    >{{ tag }}</small
                                >
                            </div>
                        </div>
                        <div class="">
                            <small class="align-top date px-1 border">{{
                                article.created_at
                            }}</small>
                        </div>
                    </div>

                    <scroll-loader
                        v-if="loadMore"
                        :loader-method="getArticles"
                        :loader-enable="loadMore"
                    >
                    </scroll-loader>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import router from '../router'
export default {
    metaInfo() {
        return { title: this.$t('home') }
    },

    data() {
        return {
            pageSize: 5,
            articles: [],
            loadMore: true,
            page: 1,
        }
    },

    methods: {
        showArticle(article) {
            router.push({ path: 'article', query: { id: article.id } })
        },

        //getting tags from string of tags
        getTags() {
            this.articles.forEach(article => {
                article.tags_array = article.tags.split(' ')
            })
        },
        getArticles() {
            setTimeout(() => {
                axios
                    .get('api/index/', {
                        params: {
                            page: this.page++,
                            per_page: this.pageSize,
                        },
                    })
                    .then(res => {
                        this.articles = [...this.articles, ...res.data.data]

                        // Stop scroll-loader
                        if (res.data.data.length === 0) {
                            this.loadMore = false
                        }
                        this.getTags()
                    })
                    .catch(error => {
                        console.log(error)
                    })
            }, 1000)
        },
    },

    async created() {
        document.body.style.overflow = 'scroll'
        this.getArticles()
    },
}
</script>

<style>
.thumbnail {
    height: 110px;
    width: 160px;
    border-radius: 3px;
}
.tag {
    background: #eee;
    color: rgb(151, 151, 151);
}
.title-container {
    cursor: pointer;
}
.date {
    color: #7e7e7e;
}
</style>
