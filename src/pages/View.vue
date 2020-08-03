<template>
    <div class="view">
        <div class="deleteWarning" v-show="warning">
            <h3>Are you sure you want to delete the post?</h3>
            <div class="btns">
                <button @click="del(postId)">Yes</button>
                <button @click="closeWarning()">No</button>
            </div>
        </div>
        <div class="filter">
            <form action="">
                <input type="text" placeholder="Filter by type" v-model="filter">
                <button @click="fil()">Filter</button>
            </form>
        </div>
        <div class="list">
            <div class="item" v-for="(item, id) in data_" :key="`posts_item_${id}`">
                <div class="data" @click="$router.push(`/posts/${item.id}`)">
                    <label for="">
                        <span>{{ item.id }}</span>
                    </label>
                    <label for="">
                        <div class="title" @click="$router.push(`/posts/${item.id}`)"><span>{{ item.title }}</span></div>
                    </label>
                    <label for="">
                        <span>{{ item.description }}</span>
                    </label>
                    <label for="">
                        <span>{{ item.creation_date }}</span>
                    </label>
                    <label for="">
                        <span>{{ item.type }}</span>
                    </label>
                </div>
                <div class="btns">
                    <button @click="openWarning(item.id)">Delete</button>
                    <button @click="update(item.id)">Update</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'View',
        data() {
            return {
                data_: [],
                warning: false,
                filter: '',
                postId: ''
            }
        },
        methods: {
            del(postId) {
                fetch(
                    `//localhost/vue-test-task/api/delete.php?id=${postId}`,
                    {
                        method: 'delete',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }
                ).then(res => res.json()).then(res => {
                    console.log(res);
                    location.reload();
                });
            },
            update(id) {
                console.log(id);
                localStorage.setItem('id', id);
                this.$router.push('/update');
            },
            openWarning(id) {
                this.warning = true;
                this.postId = id;
            },
            closeWarning() {
                this.warning = false;
            },
            fil() {
                fetch(
                    '//localhost/vue-test-task/api/filter.php',
                    {
                        method: 'post',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            filter: this.filter
                        })
                    }
                ).then(res => res.json()).then(res => {
                    console.log(res);
                    this.data_ = res.posts || [];
                    this.filter = '';
                });
            }
        },
        mounted() {
            fetch(
                '//localhost/vue-test-task/api/view.php',
                {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }
            ).then(res => res.json()).then(res => {
                console.log(res);
                this.data_ = res.data_ || [];
            });
        }
    }
</script>

<style lang="scss" scoped>
    .view {
        width: 50%;
        display: flex;
        margin: 0 auto;
        flex-direction: column;

        .deleteWarning {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border: 1px solid lightgray;
            border-radius: 4px;
            padding: 1rem;
            margin-bottom: 1rem;

            h3 {
                margin: 0;
                padding: 0;
                padding-bottom: 1rem;
            }

            .btns {
                button {
                    width: 50px;
                    padding: 5px 16px;
                    border: none;
                    border-radius: 6px;
                    font-size: 14px;
                    background-color: #1074e7;
                    color: white;
                    font-weight: 500;
                    line-height: 20px;
                    transition: .3s;

                    &:hover {
                        transition: .3s;
                        background-color: #0f63c4;
                    }

                    &:active {
                        outline: none;
                        transition: box-shadow .15s;
                        box-shadow: 0px 0px 4px 2px #5aa0f1;
                    }

                    &:focus {
                        outline: none;
                    }

                    &:not(:last-child) {
                        margin-right: 1rem;
                    }
                }
            }
        }

        .filter {
            margin-bottom: 1rem;

            form {
                display: flex;
                width: 100%;
                box-sizing: border-box;

                input {
                    width: 100%;
                    padding: 5px 12px;
                    font-size: 14px;
                    border: 1px solid lightgrey;
                    border-radius: 6px;

                    &:focus {
                        outline: none;
                        box-shadow: 0px 0px 4px 1px rgba(141,174,240,1);
                    }
                }

                button {
                    padding: .2rem 2rem;
                    margin-left: 1rem;
                    border: none;
                    border-radius: 6px;
                    font-size: .9rem;
                    background-color: #1074e7;
                    color: white;
                    font-weight: 500;
                    line-height: 20px;
                    transition: .3s;

                    &:hover {
                        transition: .3s;
                        background-color: #0f63c4;
                    }

                    &:active {
                        outline: none;
                        transition: box-shadow .15s;
                        box-shadow: 0px 0px 4px 2px #5aa0f1;
                    }

                    &:focus {
                        outline: none;
                    }
                }
            }
        }

        .list {
            display: flex;
            flex-direction: column;
            align-items: flex-start;

            .item {
                width: 100%;
                display: flex;
                align-items: center;
                border-bottom: 1px solid lightgray;

                &:hover {
                    background-color: rgba($color: lightgrey, $alpha: .25);
                }

                .data {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    
                    label {
                        padding: 1rem;
                        display: flex;
                        justify-content: center;
                        align-items: center;

                        .title {
                            > span {
                                &:hover {
                                    color: #0f63c4;
                                }
                            }
                        }
                    }
                }

                .btns {
                    margin-left: auto;
                    border-left: 1px solid lightgray;

                    button {
                        margin-left: 1rem;
                        padding: 5px 16px;
                        border: none;
                        border-radius: 6px;
                        font-size: 14px;
                        background-color: #1074e7;
                        color: white;
                        font-weight: 500;
                        line-height: 20px;
                        transition: .3s;

                        &:hover {
                            transition: .3s;
                            background-color: #0f63c4;
                        }

                        &:active {
                            outline: none;
                            transition: box-shadow .15s;
                            box-shadow: 0px 0px 4px 2px #5aa0f1;
                        }

                        &:focus {
                            outline: none;
                        }
                    }
                }
            }
        }
    }
</style>