<template>
    <div class="w-100 foot">
        <div
            class="copyright d-flex flex-column py-3 border-top justify-content-center links h-100"
        >
            <span class="w-100 d-flex text-center justify-content-center"
                >Copyright {{ year }}, UrduPure, All Rights Reserved.
            </span>
            <div class="w-100 d-flex mt-1 justify-content-center">
                <a href="http://www.urdupure.com/" class="inline">Home</a>
                &nbsp;|&nbsp;
                <a href="https://www.urdupure.com/about" class="inline"
                    >About Us</a
                >
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            year: '',
        }
    },
    created() {
        this.year = new Date().getFullYear()
    },
}
</script>

<style>
.foot {
    position: absolute;
    bottom: 0;
    width: 100%;
    background-color: #f5f5f5;
}
.copyright {
    color: #636b6f;
    padding: 0 25px;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 0.1rem;
    text-decoration: none;
    text-transform: uppercase;
}
.links > a {
    color: #636b6f;
    padding: 0 25px;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 0.1rem;
    text-decoration: none;
    text-transform: uppercase;
}
</style>
