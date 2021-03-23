<template>
    <div class="article-form w-100 h-100">
        <form
            @submit.prevent
            class="p-3 rounded h-100 bg-white"
            enctype="multipart/form-data"
        >
            <div class="form-group p-1">
                <label for="" class="form-label">Article Name</label>
                <input
                    type="text"
                    v-model="article.title"
                    class="form-control"
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
                    />
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Link</label>
                    <input
                        type="text"
                        v-model="article.link"
                        class="form-control"
                    />
                    <span class="errors">{{ errors.link }}</span>
                </div>
                <div class="form-group w-100 px-md-1">
                    <label class="form-label" for="">Select Category</label>
                    <b-form-select
                        v-model="article.category"
                        :options="categories"
                    ></b-form-select>

                    <span class="errors">{{ errors.category }}</span>
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
            </div>
            <hr />
            <div class="form-group mt-3 mb-5 d-flex justify-content-center">
                <button @click="saveArticle" class="btn shadow-lg btn-success">
                    <b-spinner
                        small
                        label="Small Spinner"
                        type="grow"
                        v-if="uploading"
                    ></b-spinner>
                    Add Article
                </button>
            </div>
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
                link: '',
                content: '',
                category: '',
                image: '',
            },
            selectedCategory: '',
            categories: [],
            errors: {},
            uploading: false,
        }
    },

    mounted() {
        document.body.style.overflow = 'hidden'
        this.getCategories()
    },

    methods: {
        async saveArticle() {
            this.validateData()
            if (Object.keys(this.errors).length === 0) {
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

                    let toast = this.$toasted.show(
                        'Article added successfully !!',
                        {
                            type: 'success',
                            position: 'top-center',
                            duration: 5000,
                        }
                    )
                } catch (error) {
                    console.log(error)
                }
            }
        },
        async getCategories() {
            const obj = this
            const response = await axios
                .get('api/get-categories-dropdown/')
                .catch(function(error) {
                    console.log(error)
                })
                .then(function(response) {
                    obj.categories = response.data
                })
        },

        getImage(e) {
            var files = e.target.files
            this.image = files[0]
        },

        validateData() {
            this.errors = []
            if (!this.article.title) {
                this.errors.title = 'Please enter the title.'
            }

            if (!this.article.link) {
                this.errors.link = 'Please enter the Link.'
            }
        },
    },
    created() {
        document.body.style.overflow = 'hidden'
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
    font-size: 12px;
    color: crimson;
}
</style>
