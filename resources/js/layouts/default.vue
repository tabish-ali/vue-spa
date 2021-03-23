<template>
    <div class="h-100 main-layout">
        <navbar />

        <div class="mt-4 mb-4 h-100" id="child-container">
            <child />
        </div>
        <site-footer id="footer" />
    </div>
</template>

<script>
import Navbar from '~/components/Navbar'
import SiteFooter from '~/components/SiteFooter'

export default {
    name: 'MainLayout',

    components: {
        Navbar,
        SiteFooter,
    },
}
</script>

<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}
html {
    position: relative;
    min-height: 100%;
}
</style>
