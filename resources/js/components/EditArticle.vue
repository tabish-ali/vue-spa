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
                    <label class="form-label" for="">Link</label>
                    <input
                        type="text"
                        v-model="article.link"
                        class="form-control"
                        value="article.youtube_id"
                    />

                    <span class="errors">{{ errors.link }}</span>
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
                            @change="getImage"
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
                <button @click="updateArticle" class="btn shadow btn-primary">
                    <b-spinner
                        small
                        label="Small Spinner"
                        type="grow"
                        v-if="uploading"
                    ></b-spinner>
                    Update
                </button>
            </div>
        </form>
    </div>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
import axios from 'axios'

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
    methods: {
        validateData() {
            this.errors = []
            if (!this.article.title) {
                this.errors.title = 'Please enter the title.'
            }
            if (!this.article.link) {
                this.errors.link = 'Please enter the Link.'
            }
        },
        async updateArticle() {
            this.validateData()
            if (Object.keys(this.errors).length === 0) {
                try {
                    this.loading = true
                    var formData = new FormData()
                    formData.append('image', this.article.image)
                    formData.append('article', JSON.stringify(this.article))
                    console.log(this.article)
                    const response = await axios.post(
                        'api/update-article',
                        formData
                    )
                    this.uploading = false
                    let toast = this.$toasted.show(
                        'Article updated successfully !!',
                        {
                            type: 'success',
                            position: 'top-center',
                            duration: 5000,
                        }
                    )
                } catch (err) {
                    console.log(err)
                }
            }
        },

        getImage(e) {
            var files = e.target.files
            this.article.image = files[0]
            console.log(this.article.image)
        },
    },
}
</script>

<style>
.errors {
    font-size: 12px;
    color: crimson;
}
</style>
