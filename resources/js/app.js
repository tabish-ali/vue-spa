import Vue from 'vue'
import store from '~/store'
import router from '~/router'
import i18n from '~/plugins/i18n'
import App from '~/components/App'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import ScrollLoader from 'vue-scroll-loader'
import Toasted from 'vue-toasted'

import '~/plugins'
import '~/components'

Vue.config.productionTip = false
Vue.use(ScrollLoader)
Vue.component('pagination', require('laravel-vue-pagination'))
Vue.use(BootstrapVue)
Vue.use(Toasted)
Vue.use(IconsPlugin)

/* eslint-disable no-new */
new Vue({
    i18n,
    store,
    router,
    ...App,
})
