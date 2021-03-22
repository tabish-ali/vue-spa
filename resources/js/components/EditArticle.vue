<template>
    <div class="article-form w-100 h-100">
        <form
            @submit.prevent
            class="shadow p-3 rounded h-100 bg-white"
            enctype="multipart/form-data"
        >
            <div class="form-group p-1">
                <label for="" class="form-label">Article Name</label>
                <input
                    type="text"
                    v-model="article.title"
                    class="form-control"
                    value="article.title"
                />
                <span class="errors">{{ errors.title }}</span>
            </div>
            <div class="d-md-flex justify-content-between px-md-1">
                <div class="form-group w-100">
                    <label class="form-label" for="">Tags</label>
                    <input
                        type="text"
                        v-model="article.tags"
                        class="form-control"
                        value="article.tags"
                    />
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Youtube ID</label>
                    <input
                        type="text"
                        v-model="article.youtube_id"
                        class="form-control"
                        value="article.youtube_id"
                    />

                    <span class="errors">{{ errors.youtubeId }}</span>
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Select Category</label>
                    <input
                        type="text"
                        v-model="article.category"
                        class="form-control"
                        value="article.category"
                    />
                </div>
            </div>
            <!---editor-->
            <div>
                <label class="form-label" for="">Content</label>
                <editor
                    v-model="article.content"
                    value="article.content"
                    api-key="no-api-key"
                    :init="{
                        height: 200,
                        menubar: false,
                        plugins: [
                            'advlist autolink lists link image charmap print preview anchor',
                            'searchreplace visualblocks code fullscreen',
                            'insertdatetime media table paste code help wordcount',
                        ],
                        toolbar:
                            'undo redo | formatselect | bold italic backcolor | \
           alignleft aligncenter alignright alignjustify | \
           bullist numlist outdent indent | removeformat | help',
                    }"
                />
            </div>
            <div class="d-flex mt-4 align-middle">
                <div class="w-100 from-group px-1">
                    <label class="form-label" for="">Image</label>
                    <div class="border">
                        <input
                            type="file"
                            @change="updateImage"
                            class=""
                            size="60"
                        />
                    </div>
                </div>
                <div class="w-100 form-group px-1">
                    <label class="form-label">External image link</label>
                    <input
                        v-model="article.externalImage"
                        type="text"
                        class="form-control"
                        value="article.external_image"
                    />
                </div>
            </div>
            <hr />
            <div class="form-group mt-3 mb-5 d-flex justify-content-center">
                <button @click="updateArticle" class="btn shadow btn-dark">
                    <b-spinner
                        v-if="uploading"
                        type="grow"
                        label="Spinning"
                    ></b-spinner>
                    Update
                </button>
            </div>
        </form>
    </div>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
export default {
    props: ['selectedArticle'],
    components: { Editor },
    data() {
        return {
            article: {},
            errors: {},
            uploading: false,
        }
    },

    created() {
        this.article = this.selectedArticle
    },

    // watch: {
    //     selectedArticle: function(val) {
    //         this.article = val
    //         console.log(this.article)
    //     },
    // },
    methods: {
        updateArticle() {},

        updateImage() {},
    },
}
</script>

<style></style>
