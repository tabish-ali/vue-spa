<template>
    <div>
        <div class="container" ref="home" style="position: relative;">
            <div class="mt-4 d-flex justify-content-center">
                <div class="card p-0 col-sm-7 col-md-9 col-12">
                    <div class="card-header">
                        Articles
                    </div>
                    <div class="card-body">
                        <a
                            class="row py-2 border-bottom mb-2 px-3 py-2 article"
                            v-for="article in articles"
                            :key="article.id"
                            :href="article.link"
                        >
                            <div class="d-flex">
                                <img
                                    class="thumbnail"
                                    v-if="article.youtube_img"
                                    :src="article.youtube_img"
                                    alt=""
                                />
                                <img
                                    class="thumbnail"
                                    :src="'storage/uploads/' + article.image"
                                    v-else-if="article.image"
                                    alt=""
                                />
                                <img
                                    v-else
                                    class="thumbnail"
                                    src="assets/default_image.jpg"
                                    alt=""
                                />
                            </div>
                            <div class="d-flex flex-grow-1 flex-column ml-lg-4">
                                <div
                                    class="title-container mt-2 my-lg-0 d-flex items-start"
                                >
                                    <h6 @click="showArticle(article)">
                                        {{ article.title.substr(0, 50) }}...
                                    </h6>
                                </div>
                                <div class="">
                                    <small class="align-top date px-1 border">{{
                                        article.created_at
                                    }}</small>
                                </div>
                                <div
                                    class="category d-flex align-items-end h-100"
                                >
                                    <small class="text-capitalize">{{
                                        article.category
                                    }}</small>
                                </div>
                                <!-- <div class="d-flex align-items-end h-100">
                                <small
                                    v-for="tag in article.tags_array"
                                    :key="tag"
                                    class="d-inline text-center font-weight-bold tag p-1 rounded mr-1"
                                    >{{ tag }}</small
                                >
                            </div> -->
                            </div>
                        </a>

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
    </div>
</template>

<script>
import axios from 'axios'
import router from '../router'
import SiteFooter from '../components/SiteFooter.vue'
export default {
    components: { SiteFooter },
    metaInfo() {
        return { title: this.$t('Home') }
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
                        if (this.articles.length > 3)
                            document.getElementById('footer').style.bottom =
                                'unset'
                    })
                    .catch(error => {
                        console.log(error)
                    })
            }, 200)
        },
    },

    async mounted() {
        document.body.style.overflow = 'auto'
        document.getElementById('child-container').classList.remove('h-100')
        document.getElementById('footer').style.display = 'block'
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
.category {
    color: rgb(151, 151, 151);
}
.article {
    cursor: pointer;
    color: #2d2d2d;
}
.article:hover {
    text-decoration: none;
    color: #000;
}
</style>
