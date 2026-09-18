<%@ Page Language="C#" MasterPageFile="~/webmaster.master" AutoEventWireup="true" CodeFile="Patient_List.aspx.cs" Inherits="Patient_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Accurate Diagnostic Lab Theme - Master-Detail Diagnostic Patient WorkList -->
    <style>
        :root {
            --adl-navy: #1F4568;
            --adl-navy-light: #2c5880;
            --adl-blue: #4272d7;
            --adl-blue-soft: #eaf0fc;
            --adl-border: #cbd5e1;
            --adl-border-light: #e2e8f0;
            --adl-bg: #f4f6fa;
            --adl-text: #1e293b;
            --adl-muted: #64748b;
            --adl-success: #10b981;
            --adl-warning: #f59e0b;
            --adl-danger: #ef4444;
            --adl-purple: #8b5cf6;
            --adl-pink: #ec4899;
        }

        /* Container Layout - Clears fixed desktop header (64px + 10px) */
        .adl-diag-app {
            padding: 74px 10px 20px 10px;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            color: var(--adl-text);
            font-size: 11.5px;
            max-width: 100%;
            margin: 0 auto;
            box-sizing: border-box;
            overflow-x: hidden;
        }

        @media (max-width: 991.98px) {
            .adl-diag-app {
                padding-top: 10px;
            }
        }

        /* Compact Strips */
        .diag-strip {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 5px;
            padding: 5px 8px;
            margin-bottom: 5px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.03);
            box-sizing: border-box;
        }

        /* Form Controls */
        .diag-ctrl {
            width: 100%;
            height: 27px;
            padding: 2px 7px;
            font-size: 11.5px;
            color: var(--adl-text);
            background-color: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            outline: none;
            box-sizing: border-box;
            transition: all 0.15s;
        }

            .diag-ctrl:focus {
                border-color: var(--adl-blue);
                box-shadow: 0 0 0 2px rgba(66, 114, 215, 0.15);
            }

        .diag-label {
            font-size: 10.5px;
            font-weight: 600;
            color: #475569;
            margin-bottom: 2px;
            display: block;
        }

        /* Filter Pills & Buttons */
        .date-pill-btn {
            background: #ffffff;
            border: 1px solid #cbd5e1;
            color: #334155;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.12s;
            white-space: nowrap;
        }

            .date-pill-btn:hover {
                background: #f1f5f9;
                color: var(--adl-navy);
            }

            .date-pill-btn.active {
                background: #1F4568;
                color: #ffffff;
                border-color: #1F4568;
            }

        /* Status Legend Tags */
        .diag-tag {
            font-size: 10px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 3px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            line-height: 1.2;
            white-space: nowrap;
        }

        .tag-outlab {
            background: #fdf2f8;
            color: #be185d;
            border: 1.5px solid #f472b6;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 4px;
        }

        .tag-edited {
            background: #fef08a;
            color: #713f12;
            border: 1.5px solid #eab308;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 4px;
        }

        .tag-partially-cancelled {
            background: #737c1d;
            color: #ffffff;
            border: 1px solid #626a15;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 3px;
        }

        .tag-cancelled {
            background: #ba4a15;
            color: #ffffff;
            border: 1px solid #a33e10;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 3px;
        }

        .tag-billedited {
            background: #ba186c;
            color: #ffffff;
            border: 1px solid #9e125b;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 3px;
        }

        .tag-uploaded {
            background: #a272d9;
            color: #ffffff;
            border: 1px solid #8d5cc4;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 3px;
        }

        /* Card Section Styling */
        .diag-card {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
            margin-bottom: 0;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .diag-card-header {
            background: #ffffff;
            border-bottom: 1px solid var(--adl-border);
            padding: 6px 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 6px;
        }

        .diag-card-title {
            font-size: 12.5px;
            font-weight: 700;
            color: var(--adl-navy);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .diag-header-title-badge {
            background: #586979;
            color: #ffffff;
            font-size: 11.5px;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 3px;
            letter-spacing: 0.2px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        /* Tables & Responsive Wrapper */
        .diag-table-box-info {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: thin;
            scrollbar-color: #94a3b8 #f1f5f9;
            height: 485px;
            max-height: 520px;
            overflow-y: auto;
            background: #ffffff;
        }

        .diag-table-box-sm {
            width: 100%;
            min-height: 185px;
            height: 195px;
            overflow-x: auto;
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
            scrollbar-width: thin;
            scrollbar-color: #94a3b8 #f1f5f9;
            background: #ffffff;
        }

        /* Distinct Divider Rail between Patient Bill Details & Patient Service List */
        .diag-grid-divider-rail {
            height: 5px;
            background: #cbd5e1;
            border-radius: 4px;
            margin: 18px 0 20px 0;
            border: 1px solid #94a3b8;
            opacity: 0.7;
        }

        .diag-table-box-info::-webkit-scrollbar,
        .diag-table-box-sm::-webkit-scrollbar {
            height: 6px;
            width: 6px;
        }

        .diag-table-box-info::-webkit-scrollbar-thumb,
        .diag-table-box-sm::-webkit-scrollbar-thumb {
            background: #94a3b8;
            border-radius: 3px;
        }

        .diag-table-box-info::-webkit-scrollbar-track,
        .diag-table-box-sm::-webkit-scrollbar-track {
            background: #f1f5f9;
        }

        .diag-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 11px;
            margin: 0;
            white-space: nowrap;
        }

            .diag-table thead th {
                position: sticky;
                top: 0;
                z-index: 2;
                background: #1F4568;
                color: #ffffff;
                font-weight: 600;
                font-size: 10.5px;
                padding: 5px 7px;
                border-bottom: 1px solid #10263a;
                letter-spacing: 0.2px;
                text-align: left;
            }

            .diag-table tbody td {
                padding: 4px 7px;
                border-bottom: 1px solid #f1f5f9;
                vertical-align: middle;
                color: #334155;
                background: #ffffff;
            }

            .diag-table tbody tr:hover td {
                background-color: #f8fafc;
            }

            .diag-table tbody tr.active-row td {
                background-color: #eff6ff !important;
                font-weight: 600;
            }

        /* Buttons */
        .btn-sm-theme {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            height: 25px;
            padding: 0 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.12s;
            text-decoration: none;
            white-space: nowrap;
        }

        .btn-sm-primary {
            background: #1F4568;
            color: #ffffff;
        }

            .btn-sm-primary:hover {
                background: #15324d;
                color: #ffffff;
            }

        .btn-sm-blue {
            background: #4272d7;
            color: #ffffff;
        }

            .btn-sm-blue:hover {
                background: #355cb8;
                color: #ffffff;
            }

        .btn-sm-light {
            background: #ffffff;
            color: #334155;
            border-color: #cbd5e1;
        }

            .btn-sm-light:hover {
                background: #f1f5f9;
                color: #0f172a;
            }

        /* Radio selector */
        .row-radio {
            cursor: pointer;
            accent-color: var(--adl-navy);
            width: 14px;
            height: 14px;
            margin: 0;
        }
    </style>

    <div class="adl-diag-app">
        <!-- 1. TOP FILTER STRIP 1 (Select Branch, Search by Scanner, Search By Visit ID) -->
        <div class="diag-strip">
            <div class="row g-2 align-items-center">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                    <div class="d-flex align-items-center gap-2">
                        <label class="diag-label mb-0 text-nowrap fw-bold" style="width: 90px;">Select Branch:</label>
                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="diag-ctrl">
                            <asp:ListItem Text="Accurate Diagnostic Lab" Value="main" Selected="True" />
                            <asp:ListItem Text="Accurate Branch - North" Value="north" />
                            <asp:ListItem Text="Accurate Branch - South" Value="south" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-light text-muted border-end-0 py-0" style="border-color: #cbd5e1;">
                            <i class="fa-solid fa-barcode text-primary"></i>
                        </span>
                        <asp:TextBox ID="txtSearchScanner" runat="server" CssClass="diag-ctrl border-start-0" placeholder="Search by Scanner"></asp:TextBox>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6">
                    <div class="d-flex align-items-center gap-1">
                        <asp:TextBox ID="txtSearchVisitID" runat="server" CssClass="diag-ctrl" placeholder="Search By Visit ID"></asp:TextBox>
                        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn-sm-theme btn-sm-primary" ToolTip="Search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </asp:LinkButton>
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-sm-theme btn-sm-light" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. TOP FILTER STRIP 2 (Select All, Customer Plan, Client Name, Doctor Name) -->
        <div class="diag-strip">
            <div class="row g-2 align-items-center">
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-4">
                    <asp:DropDownList ID="ddlSelectFilter" runat="server" CssClass="diag-ctrl">
                        <asp:ListItem Text="Select All" Value="all" Selected="True" />
                        <asp:ListItem Text="Active Visits" Value="active" />
                        <asp:ListItem Text="Billed Patients" Value="billed" />
                    </asp:DropDownList>
                </div>

                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <asp:TextBox ID="txtSearchPlan" runat="server" CssClass="diag-ctrl" placeholder="Customer Plan"></asp:TextBox>
                </div>

                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <asp:TextBox ID="txtSearchClient" runat="server" CssClass="diag-ctrl" placeholder="Client Name"></asp:TextBox>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-3 col-sm-12">
                    <asp:TextBox ID="txtSearchDoctor" runat="server" CssClass="diag-ctrl" placeholder="Doctor Name"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- 3. TOP FILTER STRIP 3 (Status Badges & Date Filter Pills) -->
        <div class="diag-strip d-flex align-items-center justify-content-between flex-wrap gap-2">
            <!-- Left Badges matching screenshot -->
            <div class="d-flex align-items-center gap-2">
                <span class="diag-tag tag-outlab">OUT LAB</span>
                <span class="diag-tag tag-edited">Patient Edited</span>
            </div>

            <!-- Right Date Filter Pills -->
            <div class="d-flex align-items-center gap-1 flex-wrap">
                <button type="button" class="date-pill-btn active" onclick="setDateFilter(this, 'today')">Today</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'yesterday')">Yesterday</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'this_week')">This Week</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'last_week')">Last Week</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'this_month')">This Month</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'last_month')">Last Month</button>
                <button type="button" class="date-pill-btn" onclick="setDateFilter(this, 'custom')">Custom</button>
            </div>
        </div>

        <!-- 4. MASTER-DETAIL SECTION (Left: Patient Info, Right: Patient Bill Details + Service List) -->
        <div class="row g-2">
            <!-- LEFT COLUMN: Patient Info Table -->
            <div class="col-xl-6 col-lg-6 col-md-12">
                <div class="diag-card h-100">
                    <div class="diag-card-header">
                        <div class="d-flex align-items-center gap-2">
                            <h2 class="diag-card-title">
                                <i class="fa-solid fa-hospital-user text-primary"></i>
                                Patient Info
                            </h2>
                            <span class="badge bg-light text-dark border" id="lblPatientCount" runat="server" style="font-size: 10px;">1-50 of 68</span>
                        </div>

                        <div class="d-flex align-items-center gap-1">
                            <select class="diag-ctrl" style="height: 24px; width: 85px; font-size: 10.5px;">
                                <option>Newest</option>
                                <option>Oldest</option>
                                <option>Name</option>
                            </select>
                            <button type="button" class="btn-sm-theme btn-sm-light" style="height: 24px; padding: 0 6px;">Prev 50</button>
                            <button type="button" class="btn-sm-theme btn-sm-primary" style="height: 24px; padding: 0 6px;">Next 50</button>
                        </div>
                    </div>

                    <div class="diag-table-box-info">
                        <asp:GridView ID="gvPatientInfo" runat="server"
                            AutoGenerateColumns="False"
                            CssClass="diag-table"
                            GridLines="None">

                            <Columns>

                                <%-- S.No --%>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <span class="text-muted fw-bold">
                                            <%# Container.DataItemIndex + 1 %>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Width="35px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                        <input type="radio"
                                            name="patientSelect"
                                            class="row-radio"
                                            value="<%# Eval("id") %>" />
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <%-- Patient ID --%>
                                <asp:BoundField DataField="patient_id" HeaderText="Patient ID" />


                                <%-- Name --%>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <span class="fw-semibold text-dark">
                                            <%# Eval("title") %>
                                            <%# Eval("first_name") %>
                                            <%# Eval("last_name") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- DOB --%>
                                <asp:BoundField DataField="DOB" HeaderText="DOB" />

                                <%-- Age/Sex --%>
                                <asp:TemplateField HeaderText="Age/Sex">
                                    <ItemTemplate>
                                        <span class="fw-bold">
                                            <%# Eval("age") %> / <%# Eval("gender") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Photo --%>
                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <a href="javascript:void(0);" class="text-secondary"
                                            title="View Patient Photo">
                                            <i class="fa-regular fa-id-badge fs-6 text-primary"></i>
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <%-- Patient Consent Form --%>
                                <asp:TemplateField HeaderText="Patient Consent Form">
                                    <ItemTemplate>
                                        <a href="javascript:void(0);" class="text-secondary"
                                            title="Download Consent Form">
                                            <i class="fa-solid fa-download text-success"
                                                style="font-size: 11px;"></i>
                                        </a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="80px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN: Stacked Patient Bill Details & Patient Service List -->
            <div class="col-xl-6 col-lg-6 col-md-12">
                <!-- Box 1: Patient Bill Details (Exactly 1 Line of Data with Container Height) -->
                <div class="diag-card">
                    <div class="diag-card-header">
                        <span class="diag-header-title-badge">Patient Bill Details
                        </span>

                        <!-- Legend Status Badges matching screenshot -->
                        <div class="d-flex align-items-center gap-1 flex-wrap">
                            <span class="diag-tag tag-partially-cancelled">Partially Cancelled</span>
                            <span class="diag-tag tag-cancelled">Cancelled</span>
                            <span class="diag-tag tag-billedited">Bill Edited</span>
                            <span class="diag-tag tag-uploaded">File uploaded</span>
                        </div>
                    </div>

                    <div class="diag-table-box-sm">
                        <asp:GridView ID="gvBillDetails" runat="server" AutoGenerateColumns="False" CssClass="diag-table" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center justify-content-center gap-1">
                                            <span>1</span>
                                            <a href="javascript:void(0);" class="text-secondary" title="Edit Bill">
                                                <i class="fa-solid fa-pen-to-square" style="font-size: 10px;"></i>
                                            </a>
                                            <a href="javascript:void(0);" class="text-primary" title="Details">
                                                <i class="fa-solid fa-shield-halved" style="font-size: 10px;"></i>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle Width="55px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Visit ID">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center gap-1">
                                            <span class="fw-bold text-dark">
                                                <%# Eval("external_visit_id") %>
                                            </span>
                                            <i class="fa-solid fa-barcode text-success" style="font-size: 11px;"></i>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="visit_datetime" HeaderText="Visit DateTime" />
                                <asp:BoundField DataField="gross" HeaderText="Gross" />
                                <asp:BoundField DataField="discount" HeaderText="Discount" />
                                <asp:BoundField DataField="vat" HeaderText="VAT" />
                                <asp:BoundField DataField="net" HeaderText="Net" ItemStyle-Font-Bold="true" ItemStyle-ForeColor="#047857" />
                                <asp:BoundField DataField="round_off" HeaderText="Round Off" />
                                <asp:BoundField DataField="collected" HeaderText="Collected" ItemStyle-Font-Bold="true" />
                                <asp:BoundField DataField="due" HeaderText="Due" />
                                <asp:BoundField DataField="refunded_amount" HeaderText="Refunded Amount" />
                                <asp:BoundField DataField="canceled_value" HeaderText="Canceled value" />
                                <asp:BoundField DataField="referred_by" HeaderText="Referred By" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <!-- Distance / Divider Bar Between The Two Grids matching screenshot -->
                <div class="diag-grid-divider-rail"></div>

                <!-- Box 2: Patient Service List (Exactly 1 Line of Data with Container Height) -->
                <div class="diag-card">
                    <div class="diag-card-header">
                        <h2 class="diag-card-title">Patient Service List
                        </h2>
                    </div>

                    <div class="diag-table-box-sm">
                        <asp:GridView ID="gvServiceList" runat="server" AutoGenerateColumns="False" CssClass="diag-table" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>1</ItemTemplate>
                                    <HeaderStyle Width="35px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="service" HeaderText="Service" ItemStyle-Font-Bold="true" />
                                <asp:BoundField DataField="sample" HeaderText="Sample" />
                                <asp:BoundField DataField="department" HeaderText="Department" />
                                <asp:BoundField DataField="status" HeaderText="Status" />
                                <asp:BoundField DataField="barcode_no" HeaderText="Barcode No" />

                                <asp:TemplateField HeaderText="Barcode RePrint">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center gap-1">
                                            <select class="diag-ctrl py-0 px-1" style="height: 20px; width: 42px; font-size: 10px;">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </select>
                                            <button type="button" class="btn btn-sm text-primary p-0 border-0 bg-transparent" title="Print Barcode">
                                                <i class="fa-solid fa-print"></i>
                                            </button>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle Width="85px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <i class="fa-solid fa-comment-dots text-success" style="font-size: 12px;"></i>
                                        </div>
                                    </ItemTemplate>
                                    <HeaderStyle Width="55px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <i class="fa-regular fa-envelope text-white"></i>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <i class="fa-regular fa-envelope text-primary" style="cursor: pointer;"></i>
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <i class="fa-regular fa-comment-dots text-white"></i>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <i class="fa-regular fa-comment-dots text-primary" style="cursor: pointer;"></i>
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <i class="fa-solid fa-print text-white"></i>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <i class="fa-solid fa-print text-primary" style="cursor: pointer;"></i>
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <i class="fa-solid fa-chart-line text-white"></i>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <i class="fa-solid fa-chart-line text-primary" style="cursor: pointer;"></i>
                                    </ItemTemplate>
                                    <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Client-side Interactive Master-Detail Row Selection & Filters -->
    <script>
        function selectPatientRow(el, patientId, name, visitId) {
            // Remove previous active classes
            document.querySelectorAll('#<%= gvPatientInfo.ClientID %> tr').forEach(r => r.classList.remove('active-row'));
            const row = el.closest('tr');
            if (row) row.classList.add('active-row');

            // Select corresponding radio
            const radio = row.querySelector('.row-radio');
            if (radio) radio.checked = true;

            // Update Right Side Detail Labels dynamically
            const badge = document.getElementById('selectedPatientBadge');
            if (badge) badge.textContent = name + " (" + patientId + ")";

            const billVisitEl = document.getElementById('billVisitId');
            if (billVisitEl && visitId) billVisitEl.textContent = visitId;
        }

        function setDateFilter(btn, range) {
            document.querySelectorAll('.date-pill-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
        }

        document.addEventListener('DOMContentLoaded', function () {
            const firstRow = document.querySelector('#<%= gvPatientInfo.ClientID %> tbody tr');
            if (firstRow) firstRow.classList.add('active-row');
        });
    </script>
</asp:Content>
