<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="ecommerce_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="generator" content="CoolAdmin 3.4.0" />
    <meta name="description" content="Sign in to the CoolAdmin dashboard." />
    <title>Sign in | Accurate</title>
    <meta name="robots" content="noindex,nofollow" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Sign in | CoolAdmin Bootstrap 5 Admin Dashboard" />
    <meta property="og:description" content="Sign in to the CoolAdmin dashboard." />
    <meta property="og:image" content="screenshots/cooladmin-bootstrap-dashboard-2.png" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Sign in | CoolAdmin Bootstrap 5 Admin Dashboard" />
    <meta name="twitter:description" content="Sign in to the CoolAdmin dashboard." />
    <meta name="theme-color" content="#4272d7" />
    <link href="css/font-face.css" rel="stylesheet" media="all" />
    <link rel="preconnect" href="https://rsms.me/" />
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
    <link href="vendor/fontawesome-7.3.1/css/all.min.css" rel="stylesheet" media="all" />
    <link href="vendor/bootstrap-5.3.8.min.css" rel="stylesheet" media="all" />
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all" />
    <link href="css/theme.css" rel="stylesheet" media="all" />
    <link href="css/app.css" rel="stylesheet" media="all" />
</head>
<body class="app auth-page">
    <a class="visually-hidden-focusable skip-link" href="#auth-form">Skip to sign-in form</a>

    <form id="form1" runat="server">

        <main class="login-wrap" id="auth-form">
            <div class="login-content">

                <a href="Dashboard.aspx" class="auth-brand" aria-label="Accurate Diagnostic Lab home">
                    <img src="images/icon/accurate%20logo.png"
                        alt="Accurate Diagnostic Lab"
                        style="width: 150px; height: auto;" />
                </a>

                <h1 class="auth-title">Welcome back</h1>
                <p class="auth-subtitle">Sign in to continue to your dashboard.</p>

                <div class="login-form">

                    <div class="form-group">
                        <asp:TextBox
                            runat="server"
                            ID="txtemail"
                            CssClass="au-input"
                            placeholder="User Id"
                            autocomplete="email">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:TextBox
                            runat="server"
                            ID="txtpassword"
                            CssClass="au-input"
                            TextMode="Password"
                            placeholder="Password"
                            autocomplete="current-password">
                        </asp:TextBox>
                    </div>

                    <div class="login-checkbox">
                        <label>
                            <input type="checkbox" name="remember">
                            Remember me
                        </label>

                        <a href="forget-pass.aspx">Forgot password?</a>
                    </div>

                    <button
                        runat="server"
                        id="btnlogin"
                        class="au-btn au-btn--green"
                        type="submit"
                        onserverclick="btnlogin_ServerClick"
                        style="width: 100%; display: flex; justify-content: center; align-items: center;">
                        Sign in
                    </button>

                    <div class="social-login-content">
                        <div class="social-button">
                            <button class="au-btn au-btn--blue"
                                type="button"
                                style="width: 100%;">
                                <i class="fa-brands fa-google" aria-hidden="true"></i>
                                Sign up with Google
                            </button>
                        </div>
                    </div>

                </div>

                <div class="register-link">
                    <p>Don't have an account? <a href="register.aspx">Create one</a></p>
                </div>

            </div>
        </main>

    </form>

    <script src="js/vanilla-utils.js"></script>
    <script src="vendor/bootstrap-5.3.8.bundle.min.js"></script>
    <script src="js/bootstrap5-init.js"></script>
    <script src="js/main-vanilla.js"></script>
    <script src="js/modern-plugins.js"></script>
</body>
</html>
