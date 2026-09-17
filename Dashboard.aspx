<%@ Page Language="C#" MasterPageFile="~/webmaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main class="main-content" id="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <!-- Page header -->
                <div class="page-header">
                    <div>
                        <h1>Dashboard</h1>
                        <p class="subtitle">Welcome back — here&rsquo;s what&rsquo;s happening at Accurate Diagnostic Lab today.</p>
                    </div>
                    <div class="page-header__actions">
                        <button type="button" class="date-chip" aria-label="Date range: last 30 days">
                            <i class="fa-regular fa-calendar"></i>
                            Last 30 days
                        
                            <i class="fa-solid fa-chevron-down" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="m-btn m-btn--ghost" id="dash-refresh-btn" aria-label="Refresh dashboard data">
                            <i class="fa-solid fa-arrows-rotate" aria-hidden="true"></i>
                            Refresh
                    
                        </button>
                        <button type="button" class="m-btn m-btn--ghost">
                            <i class="fa-solid fa-download" aria-hidden="true"></i>
                            Export
                    
                        </button>
                        <button type="button" class="m-btn m-btn--primary">
                            <i class="fa-solid fa-plus" aria-hidden="true"></i>
                            New project
                    
                        </button>
                    </div>
                </div>

                <!-- KPI strip -->

                <div class="row row-tight">

                    <!-- Total Patients -->
                    <div class="col-sm-6 col-lg-3">
                        <article class="stat-card">
                            <div class="stat-card__head">
                                <p class="stat-card__label">Total Patients</p>
                                <span class="stat-card__icon stat-card__icon--c1">
                                    <i class="fa-solid fa-users" aria-hidden="true"></i>
                                </span>
                            </div>

                            <p class="stat-card__value">
                                <asp:Label ID="lblTotalPatients" runat="server" Text="0"></asp:Label>
                            </p>

                            <p class="stat-card__delta">
                                <i class="fa-solid fa-user-plus" aria-hidden="true"></i>
                                Registered Patients
                            </p>

                            <div class="stat-card__sparkline">
                                <canvas id="kpi-patients"></canvas>
                            </div>
                        </article>
                    </div>


                    <!-- Today's Patients -->
                    <div class="col-sm-6 col-lg-3">
                        <article class="stat-card">
                            <div class="stat-card__head">
                                <p class="stat-card__label">Today's Patients</p>
                                <span class="stat-card__icon stat-card__icon--c2">
                                    <i class="fa-solid fa-user-clock" aria-hidden="true"></i>
                                </span>
                            </div>

                            <p class="stat-card__value">
                                <asp:Label ID="lblTodayPatients" runat="server" Text="0"></asp:Label>
                            </p>

                            <p class="stat-card__delta">
                                <i class="fa-solid fa-calendar-day" aria-hidden="true"></i>
                                Registered Today
                            </p>

                            <div class="stat-card__sparkline">
                                <canvas id="kpi-today-patients"></canvas>
                            </div>
                        </article>
                    </div>


                    <!-- Male Patients -->
                    <div class="col-sm-6 col-lg-3">
                        <article class="stat-card">
                            <div class="stat-card__head">
                                <p class="stat-card__label">Male Patients</p>
                                <span class="stat-card__icon stat-card__icon--c3">
                                    <i class="fa-solid fa-mars" aria-hidden="true"></i>
                                </span>
                            </div>

                            <p class="stat-card__value">
                                <asp:Label ID="lblMalePatients" runat="server" Text="0"></asp:Label>
                            </p>

                            <p class="stat-card__delta">
                                <i class="fa-solid fa-user" aria-hidden="true"></i>
                                Total Male
                            </p>

                            <div class="stat-card__sparkline">
                                <canvas id="kpi-male-patients"></canvas>
                            </div>
                        </article>
                    </div>


                    <!-- Female Patients -->
                    <div class="col-sm-6 col-lg-3">
                        <article class="stat-card">
                            <div class="stat-card__head">
                                <p class="stat-card__label">Female Patients</p>
                                <span class="stat-card__icon stat-card__icon--c4">
                                    <i class="fa-solid fa-venus" aria-hidden="true"></i>
                                </span>
                            </div>

                            <p class="stat-card__value">
                                <asp:Label ID="lblFemalePatients" runat="server" Text="0"></asp:Label>
                            </p>

                            <p class="stat-card__delta">
                                <i class="fa-solid fa-user" aria-hidden="true"></i>
                                Total Female
                            </p>

                            <div class="stat-card__sparkline">
                                <canvas id="kpi-female-patients"></canvas>
                            </div>
                        </article>
                    </div>

                </div>


            </div>
        </div>
    </main>

</asp:Content>
