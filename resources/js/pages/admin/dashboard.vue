<template>
    <div class="dashboard h-100 w-100 d-flex">
        <div class="fill d-inline-block bg-dark side-menu rounded  text-white">
            <div class="px-2 py-3 d-flex align-middle">
                <img class="logo" src="/assets/logo.png" alt="" />
                <span class="font-weight-bold ml-2 d-sm-inline d-none"
                    >Articles</span
                >
            </div>
            <hr class="divider" />
            <div class="mt-2">
                <div
                    class="px-2 py-2 items w-100"
                    @click="switchMenu('addArticles')"
                    :class="{ selected: menu.addArticles }"
                >
                    <svg
                        class="dash-icons"
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
                    <span class="d-sm-inline d-none">Add Article</span>
                </div>
                <div
                    class="px-2 py-2 items"
                    @click="switchMenu('listArticles')"
                    :class="{ selected: menu.listArticles }"
                >
                    <svg
                        class="dash-icons"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                    >
                        <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                        />
                    </svg>
                    <span class="d-sm-inline d-none">List Article</span>
                </div>
            </div>
        </div>
        <div class="overflow-scroll w-100" v-if="menu.addArticles">
            <create-article @click="switchMenu(listArticles)" />
        </div>
        <div class="overflow-auto w-100" v-if="menu.listArticles">
            <list-articles />
        </div>
    </div>
</template>

<script>
import CreateArticle from '../../components/CreateArticle.vue'
import ListArticles from '../../components/ListArticles.vue'

export default {
    components: { CreateArticle, ListArticles },
    middleware: 'auth',
    data() {
        return {
            menu: {
                addArticles: false,
                listArticles: true,
            },
            activeMenu: 'listArticles',
        }
    },
    methods: {
        switchMenu(selected) {
            for (var key in this.menu) {
                if (this.menu.hasOwnProperty(key) && selected === key) {
                    this.menu[key] = true
                    this.activeMenu = key
                } else {
                    this.menu[key] = false
                }
            }
        },
    },
    created() {},
}
</script>

<style>
.selected {
    border-left: 4px solid rgb(11, 125, 255);
}

.divider {
    border-color: #2d2d2d;
    margin: 0;
}
.dash-icons {
    width: 20px;
    height: 20px;
}
.items {
    font-size: 14px;
    margin-top: 5px;
    letter-spacing: 1px;
}
.items:hover {
    background: #2d2d2d;
    cursor: pointer;
}
.fill {
    height: 100%;
    min-height: 100%;
}
.dashboard {
    margin-top: -1.5rem;
    min-width: 100px;
}
.side-menu {
    width: 15%;
    min-width: 10%;
}
.logo {
    height: 30px;
    width: 30px;
}
@media screen and (max-width: 600px) {
    .logo {
        height: 15px;
        width: 15px;
    }
}
@media screen and (max-width: 800px) {
    .logo {
        height: 20px;
        width: 20px;
    }
}
</style>
