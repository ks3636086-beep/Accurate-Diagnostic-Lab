<%@ Page Title="Patient Services | Accurate Diagnostic Lab" Language="C#" MasterPageFile="~/webmaster.master" AutoEventWireup="true" CodeFile="Patient_Service.aspx.cs" Inherits="Patient_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Accurate Diagnostic Lab Theme - Patient Service Management Screen (Ultra Compact & Zero Unwanted Gaps) -->
    <style>
        :root {
            --adl-navy: #1F4568;
            --adl-navy-light: #2c5880;
            --adl-blue: #4272d7;
            --adl-blue-soft: #eaf0fc;
            --adl-border: #cbd5e1;
            --adl-border-light: #e2e8f0;
            --adl-bg: #f4f6fa;
            --adl-panel-bg: #f8fafc;
            --adl-text: #1e293b;
            --adl-muted: #64748b;
            --adl-success: #10b981;
            --adl-warning: #f59e0b;
            --adl-danger: #ef4444;
        }

        /* Container Layout - Snug Compact Shell (Removes huge top & left-right margins) */
        .adl-service-app {
            padding: 68px 8px 12px 8px; /* 68px precisely clears 64px fixed header, 8px on left & right */
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            color: var(--adl-text);
            font-size: 12px;
            width: 100%;
            max-width: 100%;
            margin: 0;
            box-sizing: border-box;
            overflow-x: hidden;
        }

        @media (max-width: 991.98px) {
            .adl-service-app {
                padding: 6px 6px 12px 6px;
            }
        }

        /* Compact Strips & Cards */
        .adl-strip {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 5px;
            padding: 5px 8px;
            margin-bottom: 5px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
            box-sizing: border-box;
        }

        .strip-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 4px;
            margin-bottom: 5px;
            border-bottom: 1px solid var(--adl-border-light);
        }

        .strip-title {
            font-size: 11.5px;
            font-weight: 700;
            color: var(--adl-navy);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 5px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        /* Page Top Header Bar */
        .service-topbar {
            background: linear-gradient(90deg, #1F4568 0%, #2b5c89 100%);
            border-radius: 5px;
            padding: 5px 10px;
            color: #ffffff;
            margin-bottom: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 6px;
        }

        .service-topbar-title h1 {
            font-size: 14px;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .service-topbar-title p {
            margin: 0;
            font-size: 10.5px;
            color: #cbd5e1;
        }

        .service-breadcrumb {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            font-size: 11px;
            color: #e2e8f0;
        }

            .service-breadcrumb a {
                color: #bfdbfe;
                text-decoration: none;
            }

                .service-breadcrumb a:hover {
                    text-decoration: underline;
                }

            .service-breadcrumb .sep {
                margin: 0 5px;
                color: #94a3b8;
            }

        /* Ultra Compact Form Labels & Controls */
        .c-label {
            font-size: 11px;
            font-weight: 600;
            color: #334155;
            margin-bottom: 2px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
        }

            .c-label .req {
                color: var(--adl-danger);
                font-weight: bold;
            }

        .c-ctrl {
            width: 100%;
            height: 26px;
            padding: 2px 6px;
            font-size: 11.5px;
            color: var(--adl-text);
            background-color: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.15s, box-shadow 0.15s;
        }

            .c-ctrl:focus {
                border-color: var(--adl-blue);
                box-shadow: 0 0 0 2px rgba(66, 114, 215, 0.15);
                background-color: #fff;
            }

            .c-ctrl[readonly] {
                background-color: #f1f5f9;
                color: #475569;
                cursor: not-allowed;
                font-weight: 600;
            }

        /* Buttons matching Website Theme */
        .c-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
            height: 26px;
            padding: 0 10px;
            font-size: 11.5px;
            font-weight: 600;
            border-radius: 4px;
            border: 1px solid transparent;
            cursor: pointer;
            transition: all 0.15s ease-in-out;
            text-decoration: none !important;
            white-space: nowrap;
        }

        .c-btn-primary {
            background-color: var(--adl-blue);
            color: #ffffff;
            border-color: var(--adl-blue);
        }

            .c-btn-primary:hover {
                background-color: #315ec2;
                color: #ffffff;
            }

        .c-btn-navy {
            background-color: var(--adl-navy);
            color: #ffffff;
            border-color: var(--adl-navy);
        }

            .c-btn-navy:hover {
                background-color: #173550;
                color: #ffffff;
            }

        .c-btn-default {
            background-color: #ffffff;
            color: var(--adl-text);
            border-color: var(--adl-border);
        }

            .c-btn-default:hover {
                background-color: #f8fafc;
                color: var(--adl-navy);
                border-color: #94a3b8;
            }

        .c-btn-select {
            background-color: #eff6ff;
            color: var(--adl-blue);
            border-color: #bfdbfe;
            height: 22px;
            padding: 0 8px;
            font-size: 10.5px;
            font-weight: 600;
        }

            .c-btn-select:hover {
                background-color: var(--adl-blue);
                color: #ffffff;
                border-color: var(--adl-blue);
            }

        .c-btn-action-edit {
            background: #eff6ff;
            color: var(--adl-blue);
            border: 1px solid #bfdbfe;
            padding: 2px 6px;
            height: 22px;
            font-size: 10.5px;
            border-radius: 3px;
        }

            .c-btn-action-edit:hover {
                background: var(--adl-blue);
                color: #ffffff;
            }

        .c-btn-action-del {
            background: #fef2f2;
            color: var(--adl-danger);
            border: 1px solid #fecaca;
            padding: 2px 6px;
            height: 22px;
            font-size: 10.5px;
            border-radius: 3px;
        }

            .c-btn-action-del:hover {
                background: var(--adl-danger);
                color: #ffffff;
            }

        /* Highlighted Selected Patient Card */
        .selected-patient-box {
            background: #f0f7ff;
            border: 1.5px solid #93c5fd;
            border-left: 4px solid var(--adl-blue);
            border-radius: 5px;
            padding: 6px 10px;
            margin-bottom: 5px;
        }

        .selected-patient-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 4px 10px;
            align-items: center;
        }

        .p-stat-item {
            display: flex;
            flex-direction: column;
        }

        .p-stat-label {
            font-size: 9.5px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            margin-bottom: 1px;
        }

        .p-stat-val {
            font-size: 11.5px;
            font-weight: 700;
            color: var(--adl-navy);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .badge-id {
            background: var(--adl-navy);
            color: #ffffff;
            font-size: 10.5px;
            font-weight: 700;
            padding: 1px 5px;
            border-radius: 3px;
            display: inline-block;
            width: fit-content;
        }

        /* Compact Medical Tables */
        .c-table-wrap {
            width: 100%;
            overflow-x: auto;
            overflow-y: hidden;
            -webkit-overflow-scrolling: touch;
            display: block;
            scrollbar-width: thin;
            scrollbar-color: #94a3b8 #f1f5f9;
        }

            .c-table-wrap::-webkit-scrollbar {
                height: 6px;
            }

            .c-table-wrap::-webkit-scrollbar-thumb {
                background: #94a3b8;
                border-radius: 4px;
            }

            .c-table-wrap::-webkit-scrollbar-track {
                background: #f1f5f9;
            }

        .c-table {
            width: 100%;
            min-width: 580px;
            border-collapse: collapse;
            font-size: 11.5px;
            margin: 0;
            white-space: nowrap;
        }

            .c-table thead th {
                background: #f1f5f9;
                color: #334155;
                font-weight: 700;
                font-size: 10.5px;
                padding: 5px 7px;
                border-bottom: 1.5px solid var(--adl-border);
                text-align: left;
                white-space: nowrap;
            }

            .c-table tbody td {
                padding: 4px 7px;
                border-bottom: 1px solid var(--adl-border-light);
                vertical-align: middle;
                color: var(--adl-text);
            }

            .c-table tbody tr:hover {
                background-color: #f8fafc;
            }

            .c-table tr.selected-row {
                background-color: #eff6ff !important;
            }

            .c-table .text-end {
                text-align: right;
            }

            .c-table .text-center {
                text-align: center;
            }

        /* Add Service Form Layout */
        .service-form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 6px 10px;
        }

        /* Total Amount & Save Bar */
        .save-service-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 8px;
            padding-top: 6px;
            margin-top: 6px;
            border-top: 1.5px dashed var(--adl-border);
        }

        .total-amount-display {
            font-size: 12.5px;
            color: var(--adl-navy);
            display: flex;
            align-items: center;
            gap: 6px;
        }

            .total-amount-display strong {
                font-size: 14px;
                color: var(--adl-blue);
                background: #eff6ff;
                padding: 1px 7px;
                border-radius: 4px;
                border: 1px solid #bfdbfe;
            }

        /* Empty state */
        .empty-placeholder {
            padding: 12px;
            text-align: center;
            color: var(--adl-muted);
            font-size: 11px;
        }

        /* Responsive Breakpoints */
        @media (max-width: 1199.98px) {
            .selected-patient-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 767.98px) {
            .service-topbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .selected-patient-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .service-form-row {
                grid-template-columns: 1fr;
            }

            .save-service-bar {
                flex-direction: column;
                align-items: stretch;
            }

                .save-service-bar .c-btn {
                    width: 100%;
                    height: 30px;
                }
        }

        /* Toast notifications */
        .adl-toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #1e293b;
            color: #ffffff;
            padding: 8px 14px;
            border-radius: 5px;
            font-size: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: none;
            align-items: center;
            gap: 7px;
            z-index: 9999;
        }

            .adl-toast.show {
                display: flex;
                animation: fadeIn 0.2s;
            }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(6px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <div class="adl-service-app">

        <!-- 1. PAGE HEADER & BREADCRUMB -->
        <div class="service-topbar">
            <div class="service-topbar-title">
                <h1>
                    <i class="fa-solid fa-file-medical"></i>
                    Patient Services
                </h1>
                <p>Search a patient and add services</p>
            </div>
            <ul class="service-breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa-solid fa-house" style="font-size: 10px;"></i>Home</a></li>
                <li class="sep">/</li>
                <li><a href="Patient_List.aspx">Patient List</a></li>
                <li class="sep">/</li>
                <li><strong>Patient Services</strong></li>
            </ul>
        </div>

        <!-- 2. PATIENT SEARCH / SELECTION CARD -->
        <div class="adl-strip" id="searchPatientSection">
            <div class="strip-head">
                <h2 class="strip-title">
                    <i class="fa-solid fa-magnifying-glass" style="color: var(--adl-blue);"></i>
                    Search & Select Registered Patient
                </h2>
                <span style="font-size: 10.5px; color: var(--adl-muted);">Step 1: Select a patient from list to attach services
                </span>
            </div>

            <!-- Search Inputs Row -->
            <div class="row g-2 align-items-end mb-2">
                <!-- Patient ID -->
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                    <label class="c-label" for="txtSearchPatientId">Patient ID (UHID)</label>
                    <input type="text" id="txtSearchPatientId" class="c-ctrl" placeholder="e.g. ADL/P49035" onkeyup="filterPatientTable()" />
                </div>

                <!-- Patient Name -->
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                    <label class="c-label" for="txtSearchPatientName">Patient Name</label>
                    <input type="text" id="txtSearchPatientName" class="c-ctrl" placeholder="e.g. Rahul" onkeyup="filterPatientTable()" />
                </div>

                <!-- Mobile Number -->
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                    <label class="c-label" for="txtSearchMobile">Mobile Number</label>
                    <input type="text" id="txtSearchMobile" class="c-ctrl" placeholder="e.g. 9876543210" onkeyup="filterPatientTable()" />
                </div>

                <!-- Search & Reset Buttons -->
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-6 col-12 d-flex gap-2">
                    <button type="button" class="c-btn c-btn-primary flex-grow-1" onclick="filterPatientTable()">
                        <i class="fa-solid fa-filter"></i>Search Patient
                   
                    </button>
                    <button type="button" class="c-btn c-btn-default" onclick="resetPatientSearch()">
                        <i class="fa-solid fa-arrow-rotate-left"></i>Reset
                   
                    </button>
                </div>
            </div>


            <!-- Patient List Table -->
            <div class="c-table-wrap">
                <table class="c-table" id="tblPatientDirectory">
                    <thead>
                        <tr>
                            <th style="width: 120px;">Patient ID</th>
                            <th>Patient Name</th>
                            <th style="width: 80px;">Gender</th>
                            <th style="width: 70px;">Age</th>
                            <th style="width: 120px;">Mobile</th>
                            <th style="width: 80px;" class="text-center">Action</th>
                        </tr>
                    </thead>

                    <tbody id="patientTableBody">

                        <asp:Repeater ID="rptPatients" runat="server">
                            <ItemTemplate>

                                <tr data-id="<%# Eval("patient_id") %>"
                                    data-name="<%# Eval("title") %> <%# Eval("first_name") %> <%# Eval("last_name") %>"
                                    data-gender="<%# Eval("gender") %>"
                                    data-age="<%# Eval("age") %>"
                                    data-mobile="<%# Eval("contact") %>"
                                    data-doctor="<%# Eval("dr_name") %>">

                                    <td>
                                        <span class="badge-id">
                                            <%# Eval("patient_id") %>
                                        </span>
                                    </td>

                                    <td>
                                        <strong>
                                            <%# Eval("title") %>
                                            <%# Eval("first_name") %>
                                            <%# Eval("last_name") %>
                                        </strong>
                                    </td>

                                    <td>
                                        <%# Eval("gender") %>
                                    </td>

                                    <td>
                                        <%# Eval("age") %>
                                    </td>

                                    <td>
                                        <%# Eval("contact") %>
                                    </td>

                                    <td class="text-center">
                                        <button type="button"
                                            class="c-btn c-btn-select"
                                            onclick="selectPatientRow(this)">
                                            <i class="fa-solid fa-check"></i>Select
                                        </button>
                                    </td>

                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </div>

        <!-- 3. SELECTED PATIENT INFORMATION CARD (Highlighted) -->
        <div class="selected-patient-box" id="selectedPatientCard">

            <asp:HiddenField ID="hdnPatientId" runat="server" />

            <div class="d-flex justify-content-between align-items-center mb-1 pb-1 border-bottom border-primary-subtle">
                <span style="font-weight: 700; color: var(--adl-navy); font-size: 11.5px;">
                    <i class="fa-solid fa-circle-check text-success me-1"></i>Selected Patient Information
                </span>
                <button type="button" class="c-btn c-btn-default" style="height: 20px; padding: 0 6px; font-size: 10px;" onclick="scrollToSearch()">
                    <i class="fa-solid fa-arrows-rotate"></i>Change Patient
               
                </button>
            </div>
            <div class="selected-patient-grid">
                <!-- Patient ID -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Patient ID</span>
                    <span class="p-stat-val text-primary" id="dispPatientId">ADL/P49035</span>
                </div>

                <!-- Patient Name -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Patient Name</span>
                    <span class="p-stat-val" id="dispPatientName">Rahul Kumar</span>
                </div>

                <!-- Gender -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Gender</span>
                    <span class="p-stat-val" id="dispGender">Male</span>
                </div>

                <!-- Age -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Age</span>
                    <span class="p-stat-val" id="dispAge">32 Yrs</span>
                </div>

                <!-- Mobile -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Mobile Number</span>
                    <span class="p-stat-val" id="dispMobile">9876543210</span>
                </div>

                <!-- Referral / Doctor -->
                <div class="p-stat-item">
                    <span class="p-stat-label">Referral / Doctor</span>
                    <span class="p-stat-val" id="dispDoctor" title="Dr. Sharma">Dr. Sharma</span>
                </div>
            </div>
        </div>


        <!-- 4. ADD SERVICE CARD (Clean 2-column desktop / 1-column mobile) -->
        <div class="adl-strip" id="addServiceCard">
            <div class="strip-head">
                <h2 class="strip-title">
                    <i class="fa-solid fa-notes-medical" style="color: var(--adl-blue);"></i>
                    Add Service
                </h2>
                <span style="font-size: 10.5px; color: var(--adl-muted);">Step 2: Select investigation and configure service details
                </span>
            </div>

            <div class="service-form-row">
                <!-- Column 1 -->
                <div>
                    <!-- Service Dropdown -->
                    <div class="mb-2">
                        <label class="c-label" for="ddlService">
                            Service / Investigation <span class="req">*</span>
                        </label>

                        <asp:DropDownList ID="ddlService"
                            runat="server"
                            CssClass="c-ctrl"
                            onchange="onServiceSelect()">
                        </asp:DropDownList>
                    </div>

                    <!-- Service Date -->
                    <div class="mb-2">
                        <label class="c-label" for="txtServiceDate">
                            Service Date <span class="req">*</span>
                        </label>
                        <asp:TextBox ID="txtServiceDate" runat="server" CssClass="c-ctrl" TextMode="Date"></asp:TextBox>
                    </div>
                </div>

                <!-- Column 2 -->
                <div>
                    <div class="row g-2">
                        <!-- Quantity -->
                        <div class="col-sm-6 col-12 mb-2">
                            <label class="c-label" for="txtQty">Quantity <span class="req">*</span></label>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="c-ctrl" TextMode="Number" min="1" max="99" Text="1"></asp:TextBox>
                        </div>

                        <!-- Rate -->
                        <div class="col-sm-6 col-12 mb-2">
                            <label class="c-label" for="txtRate">Rate (&#8377;) <span class="req">*</span></label>
                            <asp:TextBox ID="txtRate" runat="server" CssClass="c-ctrl" TextMode="Number" min="0" Text="0"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Calculated Amount & Add Button -->
                    <div class="row g-2 align-items-end">
                        <!-- Amount -->
                        <div class="col-sm-7 col-12 mb-2">
                            <label class="c-label" for="txtAmount">Amount (&#8377;)</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="c-ctrl" ReadOnly="true" Text="0.00"></asp:TextBox>
                        </div>

                        <!-- Add Service Button -->
                        <div class="col-sm-5 col-12 mb-2">
                            <asp:Button
                                ID="btnAddService"
                                runat="server"
                                Text="Add Service"
                                CssClass="c-btn c-btn-primary w-100"
                                OnClick="btnAddService_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- 5. ADDED SERVICES TABLE -->
        <div class="adl-strip">
            <div class="strip-head">
                <h2 class="strip-title">
                    <i class="fa-solid fa-table-list" style="color: var(--adl-blue);"></i>
                    Added Services
                </h2>
                <span style="font-size: 10.5px; color: var(--adl-muted);">Services currently queued for <strong id="lblActivePatientName">Rahul Kumar</strong>
                </span>
            </div>

            <div class="c-table-wrap">
                <table class="c-table" id="tblAddedServices">
                    <thead>
                        <tr>
                            <th>Service</th>
                            <th style="width: 120px;">Service Date</th>
                            <th style="width: 80px;" class="text-center">Quantity</th>
                            <th style="width: 100px;" class="text-end">Rate</th>
                            <th style="width: 110px;" class="text-end">Amount</th>
                            <th style="width: 110px;" class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody id="addedServicesBody">
                        <!-- Sample Row 1 -->
                        <tr data-service="Complete Blood Count (CBC)" data-date="2026-09-18" data-qty="1" data-rate="300" data-amount="300">
                            <td><strong>Complete Blood Count (CBC)</strong></td>
                            <td>18-Sep-2026</td>
                            <td class="text-center">1</td>
                            <td class="text-end">&#8377;300.00</td>
                            <td class="text-end fw-bold" style="color: var(--adl-navy);">&#8377;300.00</td>
                            <td class="text-center">
                                <div class="d-inline-flex gap-1">
                                    <button type="button" class="c-btn-action-edit" onclick="editServiceRow(this)" title="Edit Service">
                                        <i class="fa-solid fa-pencil"></i>Edit
                                   
                                    </button>
                                    <button type="button" class="c-btn-action-del" onclick="removeServiceRow(this)" title="Remove Service">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <!-- Sample Row 2 -->
                        <tr data-service="Digital Chest X-Ray (PA View)" data-date="2026-09-18" data-qty="1" data-rate="500" data-amount="500">
                            <td><strong>Digital Chest X-Ray (PA View)</strong></td>
                            <td>18-Sep-2026</td>
                            <td class="text-center">1</td>
                            <td class="text-end">&#8377;500.00</td>
                            <td class="text-end fw-bold" style="color: var(--adl-navy);">&#8377;500.00</td>
                            <td class="text-center">
                                <div class="d-inline-flex gap-1">
                                    <button type="button" class="c-btn-action-edit" onclick="editServiceRow(this)" title="Edit Service">
                                        <i class="fa-solid fa-pencil"></i>Edit
                                   
                                    </button>
                                    <button type="button" class="c-btn-action-del" onclick="removeServiceRow(this)" title="Remove Service">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Empty State -->
            <div id="emptyServicesNotice" class="empty-placeholder" style="display: none;">
                <i class="fa-solid fa-notes-medical" style="font-size: 24px; color: #cbd5e1; margin-bottom: 5px;"></i>
                <p style="margin: 0; font-weight: 600;">No services added yet.</p>
                <p style="margin: 0; font-size: 11px;">Select an investigation above and click "Add Service".</p>
            </div>

            <!-- Total Amount & Save Services Primary Action -->
            <div class="save-service-bar">
                <div class="text-muted" style="font-size: 11.5px;">
                    Total Items: <strong id="lblItemCount" style="color: var(--adl-navy);">2</strong>
                </div>

                <div class="d-flex align-items-center gap-3">
                    <div class="total-amount-display">
                        <span>Total Amount:</span>
                        <strong id="lblGrandTotal">&#8377;800.00</strong>
                    </div>

                    <button type="button" class="c-btn c-btn-primary" id="btnSaveServices" onclick="saveAllServices()" style="height: 28px; padding: 0 16px;">
                        <i class="fa-solid fa-floppy-disk"></i>
                        Save Services
                   
                    </button>
                </div>
            </div>
        </div>

    </div>

    <!-- Toast Notification Box -->
    <div id="adlToast" class="adl-toast">
        <i class="fa-solid fa-circle-check text-success"></i>
        <span id="adlToastMsg">Action completed successfully.</span>
    </div>

    <!-- Client-Side Interactions Script -->
    <script type="text/javascript">
        // Set today's date on initial load
        document.addEventListener("DOMContentLoaded", function () {
            var today = new Date().toISOString().split('T')[0];
            var dateInput = document.getElementById("txtServiceDate");
            if (dateInput) {
                dateInput.value = today;
            }
            recalculateGrandTotal();
        });

        // 1. Filter Patient directory by ID, Name or Mobile
        function filterPatientTable() {
            var idQuery = (document.getElementById("txtSearchPatientId").value || "").toLowerCase().trim();
            var nameQuery = (document.getElementById("txtSearchPatientName").value || "").toLowerCase().trim();
            var mobileQuery = (document.getElementById("txtSearchMobile").value || "").toLowerCase().trim();

            var rows = document.querySelectorAll("#patientTableBody tr");
            for (var i = 0; i < rows.length; i++) {
                var pId = (rows[i].getAttribute("data-id") || "").toLowerCase();
                var pName = (rows[i].getAttribute("data-name") || "").toLowerCase();
                var pMobile = (rows[i].getAttribute("data-mobile") || "").toLowerCase();

                var matchId = !idQuery || pId.indexOf(idQuery) > -1;
                var matchName = !nameQuery || pName.indexOf(nameQuery) > -1;
                var matchMobile = !mobileQuery || pMobile.indexOf(mobileQuery) > -1;

                if (matchId && matchName && matchMobile) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }

        function resetPatientSearch() {
            document.getElementById("txtSearchPatientId").value = "";
            document.getElementById("txtSearchPatientName").value = "";
            document.getElementById("txtSearchMobile").value = "";
            filterPatientTable();
        }

        // 2. Select patient row
        function selectPatientRow(btn) {
            var row = btn.closest("tr");
            if (!row) return;

            // Highlight active row
            var allRows = document.querySelectorAll("#patientTableBody tr");
            allRows.forEach(function (r) {
                r.classList.remove("selected-row");
            });
            row.classList.add("selected-row");

            // Extract patient values
            var pId = row.getAttribute("data-id");
            var pName = row.getAttribute("data-name");
            var pGender = row.getAttribute("data-gender");
            var pAge = row.getAttribute("data-age");
            var pMobile = row.getAttribute("data-mobile");
            var pDoctor = row.getAttribute("data-doctor");

            // Store Patient ID for ASP.NET
            document.getElementById('<%= hdnPatientId.ClientID %>').value = pId;

            // Populate selected card
            document.getElementById("dispPatientId").innerText = pId;
            document.getElementById("dispPatientName").innerText = pName;
            document.getElementById("dispGender").innerText = pGender;
            document.getElementById("dispAge").innerText = pAge;
            document.getElementById("dispMobile").innerText = pMobile;
            document.getElementById("dispDoctor").innerText = pDoctor;

            document.getElementById("lblActivePatientName").innerText = pName;

            showToast("Selected patient: " + pName + " (" + pId + ")");

            // Smooth scroll to Add Service Card
            var addCard = document.getElementById("addServiceCard");
            if (addCard) {
                addCard.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }

        function scrollToSearch() {
            var searchSec = document.getElementById("searchPatientSection");
            if (searchSec) {
                searchSec.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }

        // 3. Auto-populate rate when service is selected
        function onServiceSelect() {
            var ddl = document.getElementById("ddlService");
            var selectedOpt = ddl.options[ddl.selectedIndex];
            var rate = parseFloat(selectedOpt.getAttribute("data-rate")) || 0;

            document.getElementById("txtRate").value = rate;
            calculateAmount();
        }

        // 4. Quantity * Rate = Amount calculation
        function calculateAmount() {
            var qty = parseInt(document.getElementById("txtQty").value) || 0;
            var rate = parseFloat(document.getElementById("txtRate").value) || 0;
            if (qty < 0) qty = 0;
            if (rate < 0) rate = 0;

            var amount = qty * rate;
            document.getElementById("txtAmount").value = amount.toFixed(2);
        }

        // 5. Add Service to list
        var editTargetRow = null;

        function addServiceToList() {
            var ddl = document.getElementById("ddlService");
            var serviceName = ddl.value;

            if (!serviceName) {
                showToast("Please select a service/investigation first.");
                ddl.focus();
                return;
            }

            var serviceDate = document.getElementById("txtServiceDate").value;
            if (!serviceDate) {
                showToast("Please pick a valid service date.");
                return;
            }

            var qty = parseInt(document.getElementById("txtQty").value) || 1;
            if (qty < 1) qty = 1;

            var rate = parseFloat(document.getElementById("txtRate").value) || 0;
            var amount = qty * rate;

            var tbody = document.getElementById("addedServicesBody");

            if (editTargetRow) {
                // Updating existing row
                editTargetRow.setAttribute("data-service", serviceName);
                editTargetRow.setAttribute("data-date", serviceDate);
                editTargetRow.setAttribute("data-qty", qty);
                editTargetRow.setAttribute("data-rate", rate);
                editTargetRow.setAttribute("data-amount", amount);

                editTargetRow.children[0].innerHTML = "<strong>" + escapeHtml(serviceName) + "</strong>";
                editTargetRow.children[1].innerText = formatDate(serviceDate);
                editTargetRow.children[2].innerText = qty;
                editTargetRow.children[3].innerHTML = "&#8377;" + rate.toFixed(2);
                editTargetRow.children[4].innerHTML = "&#8377;" + amount.toFixed(2);

                editTargetRow = null;
                document.getElementById("btnAddService").innerHTML = '<i class="fa-solid fa-plus"></i> Add Service';
                showToast("Service updated successfully.");
            } else {
                // Adding new row
                var tr = document.createElement("tr");
                tr.setAttribute("data-service", serviceName);
                tr.setAttribute("data-date", serviceDate);
                tr.setAttribute("data-qty", qty);
                tr.setAttribute("data-rate", rate);
                tr.setAttribute("data-amount", amount);

                tr.innerHTML =
                    '<td><strong>' + escapeHtml(serviceName) + '</strong></td>' +
                    '<td>' + formatDate(serviceDate) + '</td>' +
                    '<td class="text-center">' + qty + '</td>' +
                    '<td class="text-end">&#8377;' + rate.toFixed(2) + '</td>' +
                    '<td class="text-end fw-bold" style="color: var(--adl-navy);">&#8377;' + amount.toFixed(2) + '</td>' +
                    '<td class="text-center">' +
                    '  <div class="d-inline-flex gap-1">' +
                    '    <button type="button" class="c-btn-action-edit" onclick="editServiceRow(this)" title="Edit Service"><i class="fa-solid fa-pencil"></i> Edit</button>' +
                    '    <button type="button" class="c-btn-action-del" onclick="removeServiceRow(this)" title="Remove Service"><i class="fa-solid fa-trash-can"></i></button>' +
                    '  </div>' +
                    '</td>';

                tbody.appendChild(tr);
                showToast("Added " + serviceName);
            }

            // Reset form fields
            ddl.value = "";
            document.getElementById("txtQty").value = "1";
            document.getElementById("txtRate").value = "0";
            document.getElementById("txtAmount").value = "0.00";

            recalculateGrandTotal();
        }

        // 6. Edit row
        function editServiceRow(btn) {
            var row = btn.closest("tr");
            if (!row) return;

            editTargetRow = row;

            var service = row.getAttribute("data-service");
            var date = row.getAttribute("data-date");
            var qty = row.getAttribute("data-qty");
            var rate = row.getAttribute("data-rate");

            var ddl = document.getElementById("ddlService");
            ddl.value = service;

            document.getElementById("txtServiceDate").value = date;
            document.getElementById("txtQty").value = qty;
            document.getElementById("txtRate").value = rate;

            calculateAmount();

            document.getElementById("btnAddService").innerHTML = '<i class="fa-solid fa-check"></i> Update Service';

            var addCard = document.getElementById("addServiceCard");
            if (addCard) {
                addCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
            showToast("Editing service. Make changes above and click Update Service.");
        }

        // 7. Remove service row
        function removeServiceRow(btn) {
            var row = btn.closest("tr");
            if (row) {
                var sName = row.getAttribute("data-service") || "service";
                row.remove();
                recalculateGrandTotal();
                showToast("Removed " + sName);
            }
        }

        // 8. Recalculate Grand Total
        function recalculateGrandTotal() {
            var rows = document.querySelectorAll("#addedServicesBody tr");
            var total = 0;

            for (var i = 0; i < rows.length; i++) {
                var amt = parseFloat(rows[i].getAttribute("data-amount")) || 0;
                total += amt;
            }

            var emptyNotice = document.getElementById("emptyServicesNotice");
            var tbl = document.getElementById("tblAddedServices");

            if (rows.length === 0) {
                emptyNotice.style.display = "block";
                tbl.style.display = "none";
            } else {
                emptyNotice.style.display = "none";
                tbl.style.display = "table";
            }

            document.getElementById("lblItemCount").innerText = rows.length;
            document.getElementById("lblGrandTotal").innerHTML = "&#8377;" + total.toFixed(2);
        }

        // 9. Save all services
        function saveAllServices() {
            var rows = document.querySelectorAll("#addedServicesBody tr");
            if (rows.length === 0) {
                showToast("Please add at least one service before saving.");
                return;
            }

            var patientName = document.getElementById("dispPatientName").innerText;
            var patientId = document.getElementById("dispPatientId").innerText;
            var totalAmount = document.getElementById("lblGrandTotal").innerText;

            showToast("Saved " + rows.length + " services successfully for " + patientName + " (" + patientId + ")! Total: " + totalAmount);
        }

        // Helper: Date format
        function formatDate(dtStr) {
            if (!dtStr) return "";
            var parts = dtStr.split("-");
            if (parts.length === 3) {
                var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                var mIdx = parseInt(parts[1], 10) - 1;
                return parts[2] + "-" + (months[mIdx] || parts[1]) + "-" + parts[0];
            }
            return dtStr;
        }

        // Helper: Toast
        function showToast(msg) {
            var toast = document.getElementById("adlToast");
            var txt = document.getElementById("adlToastMsg");
            txt.innerText = msg;
            toast.className = "adl-toast show";
            setTimeout(function () {
                toast.className = "adl-toast";
            }, 3000);
        }

        function escapeHtml(str) {
            return String(str).replace(/[&<>"']/g, function (m) {
                return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[m];
            });
        }
    </script>
</asp:Content>
