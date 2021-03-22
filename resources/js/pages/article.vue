<template>
    <div class="container mt-5 bg-white" v-if="article.title">
        <div class="d-flex justify-content-center flex-column p-1 p-sm-3">
            <div>
                <h3 class="font-weight-bold heading">
                    {{ article.title }}
                </h3>
            </div>

            <div class="d-flex border-bottom pb-2 align-items-center">
                <div v-for="(tag, index) in article.tags_array" :key="index">
                    <small class="mt-2 p-1 d-block d-sm-inline category">{{
                        tag
                    }}</small>
                </div>

                <div class="d-flex date align-items-center ml-2">
                    <svg
                        class="icon"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                        />
                    </svg>
                    <small class="p-1 d-block d-sm-inline">
                        {{ article.created_at }}</small
                    >
                </div>
            </div>

            <div
                class="mt-4 content"
                v-if="article.content"
                v-html="article.content"
            >
                <!-- {{ article.content }} -->
            </div>
            <div class="mt-2">
                <div class="d-flex flex-column">
                    <h3>Youtube</h3>
                    <a :href="article.youtube_link">
                        <img
                            :src="article.youtube_img"
                            alt="article.youtube_link"
                            class="rounded youtube_img"
                        />
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            article: {},
        }
    },
    metaInfo() {
        return { title: this.$t('Article') }
    },

    async mounted() {
        document.body.style.overflow = 'scroll'
        axios
            .get('api/get-article/', {
                params: {
                    id: this.$route.query.id,
                },
            })
            .then(res => {
                this.article = res.data
                this.getTags()
            })
            .catch(error => {
                console.log(error)
            })
    },

    methods: {
        getTags() {
            this.article.tags_array = this.article.tags.split(' ')
        },
    },
}
</script>

<style>
@media only screen and (max-width: 600px) {
    .heading {
        font-size: 18px;
    }
    .content {
        font-size: 13px;
    }
    .youtube_img {
        width: 100%;
        height: auto;
    }
}
.content {
    line-height: 28px;
}

.paragraph {
    color: #525252;
    line-height: 28px;
}
.heading {
    letter-spacing: 1px;
    color: #3b3b3b;
}
.category {
    background: #eee;
    color: rgb(151, 151, 151);
}
.date {
    color: rgb(151, 151, 151);
}
.icon {
    height: 15px;
    width: 15px;
}
</style>
