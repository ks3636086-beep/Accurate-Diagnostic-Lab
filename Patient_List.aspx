<%@ Page Language="C#" MasterPageFile="~/webmaster.master" AutoEventWireup="true" CodeFile="Patient_List.aspx.cs" Inherits="Patient_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Accurate Diagnostic Lab Theme - Compact & Responsive Patient List GridView -->
    <style>
        :root {
            --adl-navy: #1F4568;
            --adl-navy-light: #2c5880;
            --adl-blue: #4272d7;
            --adl-border: #cbd5e1;
            --adl-border-light: #e2e8f0;
            --adl-bg: #f4f6fa;
            --adl-text: #1e293b;
            --adl-muted: #64748b;
            --adl-success: #10b981;
            --adl-danger: #ef4444;
        }

        /* Container - Clears fixed desktop header (64px + margin) */
        .adl-list-container {
            padding: 74px 12px 20px 12px;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            color: var(--adl-text);
            font-size: 12px;
            max-width: 100%;
            margin: 0 auto;
            box-sizing: border-box;
        }

        @media (max-width: 991.98px) {
            .adl-list-container {
                padding-top: 10px;
            }
        }

        /* Card Container */
        .adl-card {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 6px;
            box-shadow: 0 1px 3px rgba(15, 23, 42, 0.05);
            margin-bottom: 12px;
            overflow: hidden;
        }

        /* Header Bar */
        .adl-card-header {
            background: #ffffff;
            border-bottom: 1px solid var(--adl-border);
            padding: 10px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 10px;
        }

        .adl-page-title {
            font-size: 15px;
            font-weight: 700;
            color: var(--adl-navy);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .adl-page-subtitle {
            font-size: 11px;
            color: var(--adl-muted);
            margin: 2px 0 0 0;
        }

        /* Controls / Search Bar */
        .search-ctrl {
            height: 30px;
            padding: 3px 10px;
            font-size: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            color: var(--adl-text);
            outline: none;
            transition: all 0.15s;
        }

        .search-ctrl:focus {
            border-color: var(--adl-blue);
            box-shadow: 0 0 0 2px rgba(66, 114, 215, 0.15);
        }

        .btn-adl {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            height: 30px;
            padding: 0 12px;
            border-radius: 4px;
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.15s;
            white-space: nowrap;
            text-decoration: none;
        }

        .btn-adl-primary {
            background: #1F4568;
            color: #ffffff;
            border-color: #1F4568;
        }

        .btn-adl-primary:hover {
            background: #15324d;
            color: #ffffff;
        }

        .btn-adl-blue {
            background: #4272d7;
            color: #ffffff;
            border-color: #4272d7;
        }

        .btn-adl-blue:hover {
            background: #355cb8;
            color: #ffffff;
        }

        .btn-adl-light {
            background: #ffffff;
            color: #334155;
            border-color: #cbd5e1;
        }

        .btn-adl-light:hover {
            background: #f1f5f9;
            color: #0f172a;
        }

        /* Responsive GridView Wrapper */
        .adl-grid-wrapper {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: thin;
            scrollbar-color: #94a3b8 #f1f5f9;
        }

        .adl-grid-wrapper::-webkit-scrollbar {
            height: 6px;
            width: 6px;
        }

        .adl-grid-wrapper::-webkit-scrollbar-thumb {
            background: #94a3b8;
            border-radius: 3px;
        }

        .adl-grid-wrapper::-webkit-scrollbar-track {
            background: #f1f5f9;
        }

        /* Compact GridView Table */
        .adl-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 11.5px;
            margin: 0;
            white-space: nowrap;
        }

        .adl-grid th {
            background-color: #1F4568;
            color: #ffffff;
            font-weight: 600;
            font-size: 11px;
            padding: 7px 9px;
            text-align: left;
            border-bottom: 2px solid #15324d;
            letter-spacing: 0.3px;
        }

        .adl-grid td {
            padding: 5px 9px;
            border-bottom: 1px solid #eef2f6;
            vertical-align: middle;
            color: #334155;
        }

        .adl-grid tr:nth-child(even) td {
            background-color: #f8fafc;
        }

        .adl-grid tr:hover td {
            background-color: #f1f5f9;
        }

        /* Gender & Tag Badges */
        .badge-gender-male {
            background: #eff6ff;
            color: #1d4ed8;
            border: 1px solid #bfdbfe;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 10px;
            font-weight: 600;
        }

        .badge-gender-female {
            background: #fdf2f8;
            color: #be185d;
            border: 1px solid #fbcfe8;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 10px;
            font-weight: 600;
        }

        .badge-gender-other {
            background: #f3f4f6;
            color: #4b5563;
            border: 1px solid #e5e7eb;
            padding: 2px 6px;
            border-radius: 3px;
            font-size: 10px;
            font-weight: 600;
        }

        .badge-tag {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #e2e8f0;
            padding: 1px 5px;
            border-radius: 3px;
            font-size: 10px;
            font-weight: 600;
        }

        /* Pager Styling */
        .adl-pager table {
            margin: 8px auto;
        }

        .adl-pager td {
            padding: 2px 4px;
            border: none;
            background: transparent !important;
        }

        .adl-pager a, .adl-pager span {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 24px;
            height: 24px;
            padding: 0 6px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            text-decoration: none;
        }

        .adl-pager a {
            background: #ffffff;
            color: #334155;
            border: 1px solid #cbd5e1;
            transition: all 0.15s;
        }

        .adl-pager a:hover {
            background: #1F4568;
            color: #ffffff;
            border-color: #1F4568;
        }

        .adl-pager span {
            background: #1F4568;
            color: #ffffff;
            border: 1px solid #1F4568;
        }

        /* Empty State */
        .adl-empty-box {
            padding: 35px 20px;
            text-align: center;
            color: #64748b;
        }
    </style>

    <div class="adl-list-container">
        <!-- Error / Info Notice -->
        <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-warning d-block py-2 px-3 mb-2 small" Visible="false"></asp:Label>

        <!-- Main Card -->
        <div class="adl-card">
            <!-- Top Controls Bar -->
            <div class="adl-card-header">
                <div>
                    <h1 class="adl-page-title">
                        <i class="fa-solid fa-users text-primary"></i>
                        Patient Master Directory
                    </h1>
                    <p class="adl-page-subtitle">Accurate Diagnostic Lab &mdash; Comprehensive Registered Patients List</p>
                </div>

                <!-- Right Side Actions & Search -->
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <span class="badge bg-light text-dark border py-2 px-2" style="font-size: 11px;">
                        <i class="fa-solid fa-user-check text-primary me-1"></i>
                        Total Patients: <asp:Label ID="lblTotalCount" runat="server" Text="0" Font-Bold="true" />
                    </span>

                    <div class="d-flex align-items-center gap-1">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-ctrl" placeholder="Search Name, Phone, Doctor..." style="width: 200px;"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-adl btn-adl-primary" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-adl btn-adl-light" OnClick="btnReset_Click" />
                    </div>

                    <a href="Registration.aspx" class="btn-adl btn-adl-blue">
                        <i class="fa-solid fa-user-plus"></i> New Registration
                    </a>
                </div>
            </div>

            <!-- Responsive GridView Wrapper (Horizontal Scroll on Mobile/Small Screens) -->
            <div class="adl-grid-wrapper">
                <asp:GridView ID="gvPatients" runat="server" 
                    AutoGenerateColumns="False" 
                    CssClass="adl-grid" 
                    GridLines="None"
                    AllowPaging="True" 
                    PageSize="15" 
                    OnPageIndexChanging="gvPatients_PageIndexChanging">
                    
                    <Columns>
                        <%-- S.No --%>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <span class="text-muted fw-bold"><%# Container.DataItemIndex + 1 %></span>
                            </ItemTemplate>
                            <HeaderStyle Width="35px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <%-- [title] --%>
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title">
                            <HeaderStyle Width="50px" />
                        </asp:BoundField>

                        <%-- [first_name] --%>
                        <asp:TemplateField HeaderText="First Name" SortExpression="first_name">
                            <ItemTemplate>
                                <span class="fw-bold text-dark"><%# Eval("first_name") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- [last_name] --%>
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />

                        <%-- [gender] with badge --%>
                        <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                            <ItemTemplate>
                                <%# Eval("gender") != null && Eval("gender").ToString() == "Male" 
                                    ? "<span class='badge-gender-male'><i class='fa-solid fa-mars me-1'></i>Male</span>" 
                                    : (Eval("gender") != null && Eval("gender").ToString() == "Female" 
                                        ? "<span class='badge-gender-female'><i class='fa-solid fa-venus me-1'></i>Female</span>" 
                                        : "<span class='badge-gender-other'>" + Eval("gender") + "</span>") %>
                            </ItemTemplate>
                            <HeaderStyle Width="75px" />
                        </asp:TemplateField>

                        <%-- [DOB] --%>
                        <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />

                        <%-- [age] --%>
                        <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age">
                            <HeaderStyle Width="45px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                        </asp:BoundField>

                        <%-- [type] --%>
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type">
                            <HeaderStyle Width="45px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <%-- [contact] --%>
                        <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                            <ItemTemplate>
                                <span><i class="fa-solid fa-phone text-muted me-1" style="font-size: 10px;"></i><%# Eval("contact") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- [email] --%>
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />

                        <%-- [referral_type] --%>
                        <asp:TemplateField HeaderText="Ref Type" SortExpression="referral_type">
                            <ItemTemplate>
                                <span class="badge-tag"><%# Eval("referral_type") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- [referral_name] --%>
                        <asp:BoundField DataField="referral_name" HeaderText="Referral Name" SortExpression="referral_name" />

                        <%-- [dr_name] --%>
                        <asp:TemplateField HeaderText="Doctor Name" SortExpression="dr_name">
                            <ItemTemplate>
                                <span class="text-primary fw-semibold">
                                    <i class="fa-solid fa-user-doctor me-1" style="font-size: 10px;"></i><%# Eval("dr_name") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- [rider] --%>
                        <asp:BoundField DataField="rider" HeaderText="Rider" SortExpression="rider" />

                        <%-- [external_visit_id] --%>
                        <asp:TemplateField HeaderText="Ext Visit ID" SortExpression="external_visit_id">
                            <ItemTemplate>
                                <code><%# Eval("external_visit_id") %></code>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- [remark] --%>
                        <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark" />

                        <%-- [PRO] --%>
                        <asp:BoundField DataField="PRO" HeaderText="PRO" SortExpression="PRO" />
                    </Columns>

                    <%-- Empty State --%>
                    <EmptyDataTemplate>
                        <div class="adl-empty-box">
                            <i class="fa-solid fa-hospital-user fs-1 text-muted opacity-50 mb-2"></i>
                            <h6 class="fw-bold mb-1">No Patient Records Found</h6>
                            <p class="small text-muted mb-3">No patients have been registered yet or matching your search criteria.</p>
                            <a href="Registration.aspx" class="btn-adl btn-adl-blue">
                                <i class="fa-solid fa-user-plus me-1"></i> Register New Patient
                            </a>
                        </div>
                    </EmptyDataTemplate>

                    <%-- Pager Style --%>
                    <PagerStyle CssClass="adl-pager" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
