<template>
    <div class="posts">
        <div class="list">
            <div class="data">
                <label for="">
                    <span>{{ posts.id }}</span>
                </label>
                <label for="">
                    <span>{{ posts.title }}</span>
                </label>
                <label for="">
                    <span>{{ posts.description }}</span>
                </label>
                <label for="">
                    <span>{{ posts.creation_date }}</span>
                </label>
                <label for="">
                    <span>{{ posts.type }}</span>
                </label>
                <label for="">
                    <span>{{ posts.price }}</span>
                </label>
                <label for="">
                    <span>{{ posts.country }}</span>
                </label>
                <label for="">
                    <span>{{ posts.count }}</span>
                </label>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Posts',
        data() {
            return {
                posts: {}
            }
        },
        mounted() {
            fetch(
                `//localhost/vue-test-task/api/posts.php?id=${this.$route.params.id}`,
                {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
            ).then(res => res.json()).then(res => {
                console.log(res);
                this.posts = res.posts || [];
            });
        }
    }
</script>

<style lang="scss" scoped>
    .posts {
        width: 50%;
        display: flex;
        margin: 0 auto;
        flex-direction: column;

        .list {
            display: flex;
            flex-direction: column;
            align-items: flex-start;

            .data {
                display: flex;
                align-items: center;
                    
                label {
                    padding: 1rem;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
            }
        }
    }
</style>