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
                />
            </div>
            <div class="d-md-flex justify-content-between px-md-1">
                <div class="form-group w-100">
                    <label class="form-label" for="">Tags</label>
                    <input
                        type="text"
                        v-model="article.tags"
                        class="form-control"
                    />
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Youtube ID</label>
                    <input
                        type="text"
                        v-model="article.youtubeId"
                        class="form-control"
                    />
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Select Category</label>
                    <input
                        type="text"
                        v-model="article.category"
                        class="form-control"
                    />
                </div>
            </div>
            <!---editor-->
            <div>
                <label class="form-label" for="">Content</label>
                <editor
                    v-model="article.content"
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
                    />
                </div>
            </div>
            <div class="form-group mt-3 mb-5">
                <button
                    @click="saveArticle"
                    class="btn btn-dark btn-lg btn-block"
                >
                    <b-spinner
                        v-if="uploading"
                        type="grow"
                        label="Spinning"
                    ></b-spinner>
                    Save
                </button>
            </div>
            <b-alert v-if="errors.length" class="mb-5" show variant="danger">
                <div v-for="error in errors" :key="error">
                    <span class="errors">{{ error }}</span>
                </div>
            </b-alert>
        </form>
    </div>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
import axios from 'axios'
export default {
    components: {
        editor: Editor,
    },
    data() {
        return {
            article: {
                title: '',
                tags: '',
                youtubeId: '',
                content: '',
                category: '',
                image: '',
                externalImage: '',
            },
            errors: [],
            uploading: false,
        }
    },

    mounted() {
        document.body.style.overflow = 'hidden'
    },

    methods: {
        async saveArticle() {
            this.validateData()
            if (this.errors.length === 0) {
                try {
                    var formData = new FormData()
                    formData.append('image', this.image)
                    formData.append('article', JSON.stringify(this.article))
                    this.uploading = true
                    const response = await axios.post(
                        'api/post-article',
                        formData
                    )
                    this.uploading = false
                    this.$toast.success('Article added successfully', {
                        timeout: 3000,
                        position: POSITION.BOTTOM_CENTER,
                    })
                } catch (error) {
                    console.log(error)
                }
                this.uploading = false
            }
        },

        getImage(e) {
            var files = e.target.files
            this.image = files[0]
        },

        validateData() {
            this.errors = []
            if (!this.article.title) {
                this.errors.push('Please enter the title.')
            }
            // if (!this.article.content) {
            //     this.errors.push('please enter the content.')
            // }
            if (!this.article.youtubeId) {
                this.errors.push('Please enter the Youtube Id.')
            }
        },
    },
}
</script>

<style>
.tox-notifications-container {
    display: none;
}
.article-form {
    overflow: scroll;
}
body {
    overflow-y: hidden;
}
.article-form .form-label {
    font-size: 14px;
    color: #2d2d2d;
}
.errors {
    font-size: 14px;
}
</style>
