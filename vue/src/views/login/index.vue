<template>
    <div class="blankon-app">
        <div class="" id="sign-wrapper">
            <div class="brand">{{ config.title }}</div>
            <form v-loading="loading" class="sign-in form-horizontal shadow rounded no-overflow" action="javascript:;" @submit="login" method="post">
                <div class="sign-header">
                    <div class="form-group">
                        <div class="sign-text">
                            <span>系统登录</span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.sign-header -->
                <div class="sign-body">
                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="text" class="form-control input-sm" placeholder="用户名" v-model="form.username" name="username" />
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="password" class="form-control input-sm" placeholder="输入密码" v-model="form.pwd" name="password" />
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        </div>
                    </div>
                    <!-- /.form-group -->
                    <div class="form-group" v-if="rules.length>1">
                        <el-select v-model="form.cx" style="width: 100%">
                            <el-option :label="r" :value="r" v-for="r in rules"></el-option>
                        </el-select>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <div class="input-group input-group-lg rounded no-overflow">
                            <input type="text" class="form-control" v-model="form.pagerandom" name="pagerandom" placeholder="验证码" required="" />
                            <span class="input-group-addon">
                                <img
                                    alt="刷新验证码"
                                    style="width: 120px; height: 30px; max-width: none; max-height: none"
                                    title="点击刷新验证码"
                                    @click="loadCaptchToInput"
                                    :src="captchUrl"
                                    unselectable="on"
                                    class="img"
                                />
                            </span>
                        </div>
                    </div>
                </div>
                <!-- /.sign-body -->
                <div class="sign-footer">
                    <div class="form-group">
                        <button type="submit" class="btn btn-theme btn-lg btn-block no-margin rounded" id="login-btn">登录</button>
                    </div>
                    <!-- /.form-group -->
                </div>
                <!-- /.sign-footer -->
            </form>
        </div>
    </div>
</template>

<script>
    import config from "@/config";
    import { canLogin } from "@/stores";
    import { captch } from "@/utils/utils";
    export default {
        name: "blankon",
        data() {
            return {
                config,
                loading: false,
                form: {
                    username: "",
                    pwd: "",
                    cx: "管理员",

                    /* 验证码段 */
                    pagerandom: "",
                    a: "a",
                    /* 验证码段 */
                },
                captchUrl: "",
                rules: ["管理员","官方组织"],
            };
        },
        watch: {},
        computed: {},
        methods: {
            loadCaptchToInput() {
                this.loadCaptch();
                this.form.pagerandom = "";
                this.$refs.random.focus();
            },
            loadCaptch() {
                captch().then((res) => {
                    console.log(res);
                    this.form.captchToken = res.token;
                    this.captchUrl = res.url;
                });
            },
            validateLogin() {
                var form = this.form;
                var username = form.username;
                var pwd = form.pwd;

                if (username == "") {
                    this.$message.error("帐号不能为空");
                    return false;
                }
                if (pwd == "") {
                    this.$message.error("密码不能为空");
                    return false;
                }
                return true;
            },
            login() {
                if (this.validateLogin()) {
                    this.loading = true;
                    canLogin(this.form)
                        .then((res) => {
                            this.loading = false;
                            if (res.code == 0) {
                                this.$message.success("登录成功");
                                var redirect = this.$route.query.redirect;
                                if (redirect) {
                                    this.$router.replace(redirect);
                                } else {
                                    this.$router.replace("/admin/sy");
                                }
                            } else {
                                this.$message.error(res.msg);
                            }
                        })
                        .catch((err) => {
                            this.loading = false;
                            this.$message.error(err.message);
                        });
                }
            },
        },
        created() {
            this.form.cx = this.rules[0];
            this.loadCaptch();
        },
        mounted() {},
        destroyed() {},
    };
</script>
<style type="text/scss" lang="scss">
    .blankon-app {
        height: 100%;
        width: 100%;
        background: url("../login/bg6.jpg") no-repeat;
        background-attachment: fixed;
        color: #636e7b;
        -webkit-font-smoothing: antialiased;
        direction: ltr;
        line-height: 21px;
        margin: 0;
        padding: 0;

        #sign-wrapper {
            width: 350px;
            margin: 0px auto;
            padding-top: 5%;
            height: 100%;
            position: relative;
            .brand {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
            }
            form {
                background-color: #ffffff;
            }
            shadow {
                -webkit-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
                -moz-box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
                box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.05) !important;
            }
            .sign-header {
                background-color: #81b71a;
                border-bottom: 10px solid #6b9816;
                color: white;
                padding: 20px 15px;
                margin-bottom: 0px;

                -webkit-border-top-left-radius: 3px;
                -moz-border-radius-topleft: 3px;
                border-top-left-radius: 3px;
                -webkit-border-top-right-radius: 3px;
                -moz-border-radius-topright: 3px;
                border-top-right-radius: 3px;
            }
            form .form-group {
                position: relative;
                margin-left: 0px !important;
                margin-right: 0px !important;
            }
            .form-group {
                margin-left: 0;
                margin-right: 0;
                padding: 0 15px;
                margin-bottom: 15px;
            }
            .form-group:last-child {
                margin-bottom: 0;
            }
            .sign-text {
                color: #777;
                display: block;
                font-size: 15px;
                text-transform: uppercase;
                margin-top: 10px;
                margin-bottom: 10px;
                position: relative;
                text-align: center;
                span {
                    display: inline-block;
                    padding: 0 10px;
                    position: relative;
                    color: white;
                    font-weight: 300;
                    background-color: #81b71a;
                }
            }
            .sign-text:before {
                content: "";
                display: block;
                height: 1px;
                left: 0;
                position: absolute;
                right: 0;
                top: 50%;
            }
            .sign-text:before {
                background-color: #9fe024;
            }
            .sign-body {
                background-color: rgba(234, 234, 236, 0.72);
                margin: 0px;
                padding: 15px 0px;
            }
            .input-group {
                position: relative;
                display: table;
                border-collapse: separate;
            }
            .no-overflow {
                overflow: visible !important;
            }
            .rounded {
                -webkit-border-radius: 3px !important;
                -moz-border-radius: 3px !important;
                border-radius: 3px !important;
            }
            .form-control {
                display: block;
                width: 100%;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #555;
                margin-bottom: 10px;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                -webkit-transition: border-color ease-in-out 0.15s, -webkit-box-shadow ease-in-out 0.15s;
                -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            }
            .input-sm {
                height: 30px;
                padding: 5px 10px;
                font-size: 12px;
                line-height: 1.5;
                border-radius: 3px;
            }
            .input-group {
                position: relative;
                display: table;
                border-collapse: separate;
            }
            .input-group .form-control {
                position: relative;
                z-index: 2;
                float: left;
                width: 100%;
                margin-bottom: 0;
            }
            .input-group-lg > .form-control {
                height: 46px;
                padding: 10px 16px;
                font-size: 18px;
                line-height: 1.3333333;
                border-radius: 6px;
                border-radius: 0px;
            }
            .input-group .form-control {
                display: table-cell;
            }
            .input-group .form-control:first-child {
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
            }
            input {
                border: none !important;
                font-size: 12px !important;
            }
            input:focus {
                box-shadow: none;
                outline: none;
            }
            .form-group .input-group input[type="text"] {
                box-shadow: none !important;
                border: none !important;
                color: #B6B6B6;
            }
            .form-group .input-group-addon {
                background-color: white;
            }
            .input-group-addon {
                display: table-cell;
                width: 1%;
                white-space: nowrap;
                vertical-align: middle;
                color: #555;
                text-align: center;
                border: none;
                padding-left: 0px;
                border-radius: 0px;
                height: 46px;
                min-width: 39px;
                font-size: 18px;
                line-height: 1.3333333;
            }
            i {
                font-size: 23px;
                color: #B6B6B6;
            }
            .no-margin {
                margin: 0 !important;
            }
            .btn-block {
                display: block;
                width: 100%;
            }
            .btn-theme {
                outline: none !important;
                padding: 10px 16px;
                border: none;
                font-size: 18px;
                line-height: 1.3333333;
                transition: all 0.3s;
                position: relative;
                z-index: 1;
                font-weight: 300;
                border-radius: 0px;
                background-color: #81b71a;
                border-color: #81b71a;
                color: white;
            }
            .sign-body {
                background-color: rgba(234, 234, 236, 0.72);
                margin: 0px;
                padding: 15px 0px;
            }
            .sign-footer {
                padding: 15px 0px;
            }
        }
    }
</style>
