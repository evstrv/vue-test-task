<template>
    <header>
        <button @click="insert">Insert</button>
        <button @click="view">View</button>
    </header>
</template>

<script>
    export default {
        name: 'Main',
        data() {
            return {
                
            }
        },
        methods: {
            insert() {
                this.$router.push('/insert');
            },
            view() {
                this.$router.push('/view');
            }
        }
    }
</script>

<style lang="scss" scoped>
    header {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 50px;
        margin-bottom: 1rem;

        button {
            width: auto;
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
</style>