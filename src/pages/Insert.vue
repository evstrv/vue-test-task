<template>
    <div class="insert">
        <div class="column">
            <form action="">
                <label for="">
                    <span>title</span>
                    <input type="text" v-model="title">
                </label>
                <label for="">
                    <span>description</span>
                    <input type="text" v-model="description">
                </label>
                <label for="">
                    <span>type</span>
                    <input type="text" v-model="type">
                </label>
                <label for="">
                    <span>price</span>
                    <input type="text" v-model="price">
                </label>
                <label for="">
                    <span>country</span>
                    <input type="text" v-model="country">
                </label>
                <label for="">
                    <span>count</span>
                    <input type="text" v-model="count">
                </label>
                <div class="btns">
                    <button @click="insert">Insert</button>
                    <button @click="view">Back</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Insert',
        data() {
            return {
                title: '',
                description: '',
                type: '',
                price: '',
                country: '',
                count: '',
                needCheck: false
            }
        },
        computed: {
            isError() {
                if(this.needCheck) {
                    return !(this.title, this.description, this.type, this.price, this.country, this.count);
                }
                return false;
            }
        },
        methods: {
            insert(event) {
                event.preventDefault();
                this.needCheck = true;
                if(!this.isError) {
                    fetch(
                        '//localhost/vue-test-task/api/insert.php',
                        {
                            method: 'post',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                title: this.title,
                                description: this.description,
                                type: this.type,
                                price: this.price,
                                country: this.country,
                                count: this.count
                            })
                        }
                    ).then(res => res.json()).then(res => {
                        console.log(res);   
                        if(res && res.res) {
                            this.title = '',
                            this.description = '',
                            this.type = '',
                            this.price = '',
                            this.country = '',
                            this.count = '',
                            this.needCheck = false,
                            this.$router.push('/view')
                        }
                    }).catch(err => {
                        console.log(err);
                    });
                }
            },
            view() {
                this.$router.push('/view');
            }
        }
    }
</script>

<style lang="scss" scoped>
    .insert {
        display: flex;
        justify-content: center;

        .column {
            width: 30%;
            box-sizing: border-box;
            border-radius: 4px;
            padding: 1rem;
            box-shadow: 0 0 4px 1px lightgrey;

            form {
                label {
                    display: flex;
                    flex-direction: column;
                    margin: 0 0 7px;
                    font-size: 14px;

                    input {
                        margin: 5px 0 15px;
                        padding: 5px 12px;
                        font-size: 14px;
                        border: 1px solid rgba($color: gray, $alpha: .5);
                        border-radius: 6px;

                        &:focus {
                            outline: none;
                            box-shadow: 0px 0px 5px 1px rgba(141,174,240,1);
                        }
                    }
                }

                .btns {
                    display: flex;
                    justify-content: space-between;

                    button {
                        width: 45%;
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