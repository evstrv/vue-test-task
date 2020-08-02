import VueRouter from "vue-router"
import Insert from "./pages/Insert"
import Update from "./pages/Update"
import View from "./pages/View"
import Posts from "./pages/Posts"

const routes = [
    {path: '/insert', component: Insert},
    {path: '/update', component: Update},
    {path: '/view', component: View},
    {path: '/posts/:id', component: Posts}
];

export default new VueRouter({routes});