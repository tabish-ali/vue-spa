<template>
    <div class="h-100 main-layout">
        <navbar />

        <div class="mt-4 h-100">
            <child />
        </div>
    </div>
</template>

<script>
import Navbar from '~/components/Navbar'

export default {
    name: 'MainLayout',

    components: {
        Navbar,
    },
}
</script>

<style>
body {
    font-family: 'Roboto', sans-serif;
}
</style>
