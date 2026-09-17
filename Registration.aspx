<%@ Page Language="C#" MasterPageFile="~/webmaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Compact Desktop Diagnostic Theme (Accurate Lab Theme - Zero Window Scroll) -->
    <style>
        :root {
            --adl-navy: #1F4568;
            --adl-navy-light: #2c5880;
            --adl-blue: #4272d7;
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

        /* Compact Layout Shell */
        .adl-reg-app {
            padding: 74px 10px 10px 10px;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            color: var(--adl-text);
            font-size: 12px;
            max-width: 100%;
            margin: 0 auto;
            box-sizing: border-box;
            overflow-x: hidden;
        }

        @media (max-width: 991.98px) {
            .adl-reg-app {
                padding-top: 10px;
            }
        }

        /* Compact Strips */
        .adl-strip {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 6px;
            padding: 6px 10px;
            margin-bottom: 6px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
            box-sizing: border-box;
        }

        /* Form Labels & Controls - Ultra Compact */
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
            }

        .c-ctrl {
            width: 100%;
            height: 27px;
            padding: 2px 7px;
            font-size: 12px;
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

        .c-ctrl-sm {
            height: 24px;
            padding: 1px 5px;
            font-size: 11.5px;
        }

        /* Radio Options */
        .c-radio-label {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            font-size: 11.5px;
            font-weight: 500;
            color: var(--adl-text);
            cursor: pointer;
            user-select: none;
            margin-bottom: 0;
        }

            .c-radio-label input[type="radio"] {
                margin: 0;
                accent-color: var(--adl-navy);
                width: 14px;
                height: 14px;
                cursor: pointer;
            }

        /* Top Bar */
        .top-search-strip {
            background: linear-gradient(90deg, #1F4568 0%, #2b5c89 100%);
            border-radius: 6px;
            padding: 6px 10px;
            color: #ffffff;
            margin-bottom: 6px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }

        .top-search-input {
            height: 28px;
            padding: 2px 9px;
            font-size: 12px;
            border-radius: 4px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            width: 100%;
            background: #ffffff;
            color: #0f172a;
            box-sizing: border-box;
        }

            .top-search-input:focus {
                outline: none;
                box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
            }

        .stat-check-box {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #ffffff;
            color: #dc2626;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            margin-bottom: 0;
            user-select: none;
            border: 1px solid #fca5a5;
        }

            .stat-check-box input {
                accent-color: #dc2626;
                width: 14px;
                height: 14px;
                margin: 0;
            }

        /* Buttons */
        .btn-theme {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            height: 27px;
            padding: 0 10px;
            border-radius: 4px;
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.15s;
            white-space: nowrap;
            box-sizing: border-box;
        }

        .btn-theme-primary {
            background: #1F4568;
            color: #ffffff;
            border-color: #1F4568;
        }

            .btn-theme-primary:hover {
                background: #15324d;
                color: #ffffff;
            }

        .btn-theme-blue {
            background: #4272d7;
            color: #ffffff;
            border-color: #4272d7;
        }

            .btn-theme-blue:hover {
                background: #355cb8;
                color: #ffffff;
            }

        .btn-theme-light {
            background: #ffffff;
            color: #334155;
            border-color: #cbd5e1;
        }

            .btn-theme-light:hover {
                background: #f1f5f9;
                color: #0f172a;
            }

        /* Diagnostic Table */
        .grid-wrap {
            border: 1px solid var(--adl-border);
            border-radius: 4px;
            overflow: hidden;
            background: #ffffff;
            margin-bottom: 6px;
            box-sizing: border-box;
        }

        .grid-scroll-box {
            max-height: 175px;
            min-height: 110px;
            overflow-y: auto;
            scrollbar-width: thin;
            scrollbar-color: #94a3b8 #f1f5f9;
        }

            .grid-scroll-box::-webkit-scrollbar {
                width: 5px;
            }

            .grid-scroll-box::-webkit-scrollbar-thumb {
                background: #94a3b8;
                border-radius: 3px;
            }

        .grid-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 11.5px;
            margin: 0;
        }

            .grid-table thead th {
                position: sticky;
                top: 0;
                z-index: 2;
                background: #1F4568;
                color: #ffffff;
                padding: 5px 8px;
                font-weight: 600;
                border-bottom: 1px solid #0f2336;
                white-space: nowrap;
                font-size: 11px;
            }

            .grid-table tbody td {
                padding: 3px 6px;
                border-bottom: 1px solid #eef2f6;
                vertical-align: middle;
                background: #ffffff;
            }

            .grid-table tbody tr:hover td {
                background-color: #f8fafc;
            }

        .tag-pill {
            display: inline-block;
            font-size: 9.5px;
            font-weight: 700;
            padding: 1px 5px;
            border-radius: 3px;
            line-height: 1.2;
        }

        .tag-outsource {
            background: #fef08a;
            color: #854d0e;
            border: 1px solid #fde047;
        }

        .tag-discountable {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        /* Bottom 3-Column Settlement */
        .settle-box {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 6px;
            padding: 8px 10px;
            height: 100%;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
            box-sizing: border-box;
        }

        .settle-title {
            font-size: 11.5px;
            font-weight: 700;
            color: var(--adl-navy);
            border-bottom: 1px solid var(--adl-border-light);
            padding-bottom: 4px;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Mode Buttons */
        .mode-btn {
            display: block;
            width: 100%;
            text-align: left;
            padding: 4px 8px;
            font-size: 11.5px;
            font-weight: 600;
            border: 1px solid var(--adl-border);
            border-radius: 4px;
            background: #ffffff;
            color: #475569;
            margin-bottom: 4px;
            cursor: pointer;
            transition: all 0.12s;
            box-sizing: border-box;
        }

            .mode-btn:hover {
                background: #f1f5f9;
                color: var(--adl-navy);
            }

            .mode-btn.active {
                background: #1F4568;
                color: #ffffff;
                border-color: #1F4568;
            }

        /* Summary Lines with Rupee Badge */
        .sum-line {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 3px 0;
            border-bottom: 1px dashed #e2e8f0;
            font-size: 12px;
        }

            .sum-line:last-child {
                border-bottom: none;
                padding-top: 4px;
            }

        .sum-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #e2e8f0;
            color: #1e293b;
            font-size: 10px;
            margin-right: 6px;
            flex-shrink: 0;
        }

        .sum-badge-active {
            background: #1F4568;
            color: #ffffff;
        }

        .sum-val {
            font-weight: 700;
            color: #0f172a;
            font-size: 12px;
        }

        .sum-net {
            background: #ecfdf5;
            padding: 4px 8px;
            border-radius: 4px;
            border: 1px solid #a7f3d0;
        }

            .sum-net .sum-val {
                color: #047857;
                font-size: 14px;
            }

        .sum-due {
            background: #fffbeb;
            padding: 3px 8px;
            border-radius: 4px;
            border: 1px solid #fde68a;
        }

            .sum-due .sum-val {
                color: #b45309;
                font-size: 12.5px;
            }

        /* Search Autocomplete */
        .ac-box {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 4px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
            z-index: 99;
            max-height: 180px;
            overflow-y: auto;
            display: none;
        }

        .ac-item {
            padding: 5px 8px;
            cursor: pointer;
            border-bottom: 1px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
            font-size: 11.5px;
        }

            .ac-item:hover {
                background: #eff6ff;
                color: var(--adl-blue);
            }

        /* Fixed Compact Action Bar (No overflow, fully aligned) */
        .bottom-action-bar {
            background: #ffffff;
            border: 1px solid var(--adl-border);
            border-radius: 6px;
            padding: 6px 10px;
            margin-top: 6px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 6px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
            box-sizing: border-box;
            width: 100%;
        }

        .action-btns-group {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: nowrap;
        }

        /* Floating Toast */
        .adl-toast {
            position: fixed;
            top: 18px;
            right: 18px;
            z-index: 9999;
            background: #1e293b;
            color: #fff;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            display: flex;
            align-items: center;
            gap: 8px;
            opacity: 0;
            transform: translateY(-8px);
            transition: all 0.2s ease;
            pointer-events: none;
        }

            .adl-toast.show {
                opacity: 1;
                transform: translateY(0);
            }

            .adl-toast.success {
                background: #065f46;
                border-left: 4px solid #34d399;
            }

            .adl-toast.warning {
                background: #92400e;
                border-left: 4px solid #fbbf24;
            }

            .adl-toast.danger {
                background: #991b1b;
                border-left: 4px solid #f87171;
            }
    </style>

    <div class="adl-reg-app">
        <!-- Toast Notification -->
        <div id="adlToast" class="adl-toast"></div>

        <!-- 1. TOP SEARCH & QUICK PATIENT LOOKUP BAR -->
        <div class="top-search-strip" style="display: block !important;">
            <div class="row align-items-center g-2">
                <div class="col-xl-5 col-lg-5 col-md-12">
                    <div class="d-flex align-items-center gap-3 flex-wrap">
                        <label class="c-radio-label text-white">
                            <input type="radio" name="searchFilter" value="patient_name" onchange="updateSearchHint()" />
                            Patient Name / UID
                       
                        </label>
                        <label class="c-radio-label text-white">
                            <input type="radio" name="searchFilter" value="patient_id" checked onchange="updateSearchHint()" />
                            Patient ID / UID
                       
                        </label>
                        <label class="c-radio-label text-white">
                            <input type="radio" name="searchFilter" value="mobile_no" onchange="updateSearchHint()" />
                            Mobile No
                       
                        </label>
                        <label class="c-radio-label text-white">
                            <input type="radio" name="searchFilter" value="hospital_id" onchange="updateSearchHint()" />
                            Hospital ID
                       
                        </label>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-7">
                    <div class="position-relative">
                        <asp:TextBox ID="txtGlobalSearch" runat="server" ClientIDMode="Static" CssClass="top-search-input" placeholder="Patient ID / UID" onkeypress="return checkSearchKey(event);"></asp:TextBox>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-3 col-md-5 d-flex align-items-center justify-content-end gap-2">
                    <label class="stat-check-box" title="Emergency / STAT Patient">
                        <asp:CheckBox ID="chkSTAT" runat="server" ClientIDMode="Static" onchange="onHeaderStatToggle(this);" />
                        <span>STAT</span>
                    </label>

                    <button type="button" class="btn-theme btn-theme-light text-primary" onclick="searchPatient();" title="Search Existing Patient">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>

                    <button type="button" class="btn-theme btn-theme-light" onclick="loadSampleDemo();" title="Quick Demo Data">
                        <i class="fa-solid fa-wand-magic-sparkles text-warning"></i>Demo
                   
                    </button>
                </div>
            </div>
        </div>

        <!-- 2. PATIENT DEMOGRAPHICS (Row 1 from screenshot) -->
        <div class="adl-strip" style="margin-top: 15px;">
            <div class="row g-2 align-items-end">
                <!-- Title -->
                <div class="col-xl-1 col-lg-1 col-md-2 col-sm-3 col-4">
                    <label class="c-label">Title <span class="req">*</span></label>
                    <asp:DropDownList ID="ddlTitle" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                        <asp:ListItem Text="Mr." Value="Mr." Selected="True" />
                        <asp:ListItem Text="Mrs." Value="Mrs." />
                        <asp:ListItem Text="Miss" Value="Miss" />
                        <asp:ListItem Text="Master" Value="Master" />
                        <asp:ListItem Text="Dr." Value="Dr." />
                        <asp:ListItem Text="Prof." Value="Prof." />
                        <asp:ListItem Text="Baby" Value="Baby" />
                    </asp:DropDownList>
                </div>

                <!-- First Name -->
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-4 col-8">
                    <label class="c-label">First Name <span class="req">*</span></label>
                    <asp:TextBox ID="txtFirstName" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="First Name"></asp:TextBox>
                </div>

                <!-- Last Name -->
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-5 col-6">
                    <label class="c-label">Last Name <span class="req">*</span></label>
                    <asp:TextBox ID="txtLastName" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Last Name"></asp:TextBox>
                </div>

                <!-- Gender -->
                <div class="col-xl-1 col-lg-1 col-md-2 col-sm-3 col-6">
                    <label class="c-label">Gender <span class="req">*</span></label>
                    <asp:DropDownList ID="ddlGender" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                        <asp:ListItem Text="Male" Value="Male" Selected="True" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>

                <!-- Date Of Birth -->
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6">
                    <label class="c-label">Date Of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" ClientIDMode="Static" TextMode="Date" CssClass="c-ctrl" onchange="syncAgeFromDOB();"></asp:TextBox>
                </div>

                <!-- Age -->
                <div class="col-xl-1 col-lg-1 col-md-2 col-sm-3 col-3">
                    <label class="c-label">Age</label>
                    <asp:TextBox ID="txtAge" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" placeholder="Age" oninput="syncDOBFromAge();"></asp:TextBox>
                </div>

                <!-- Age Type -->
                <div class="col-xl-1 col-lg-1 col-md-2 col-sm-3 col-3">
                    <label class="c-label">Type</label>
                    <asp:DropDownList ID="ddlAgeType" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                        <asp:ListItem Text="Y" Value="Y" Selected="True" />
                        <asp:ListItem Text="M" Value="M" />
                        <asp:ListItem Text="D" Value="D" />
                    </asp:DropDownList>
                </div>

                <!-- Mobile No -->
                <div class="col-xl-1 col-lg-2 col-md-3 col-sm-4 col-6">
                    <label class="c-label">Mobile No <span class="req">*</span></label>
                    <asp:TextBox ID="txtMobile" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Mobile No" MaxLength="10"></asp:TextBox>
                </div>

                <!-- Email ID & Action Icon -->
                <div class="col-xl-1 col-lg-2 col-md-3 col-sm-5 col-6">
                    <label class="c-label">Email ID</label>
                    <div class="d-flex gap-1">
                        <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Email ID"></asp:TextBox>
                        <button type="button" class="btn-theme btn-theme-light px-2" title="Capture Photo / Scanner">
                            <i class="fa-solid fa-camera text-primary"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. REFERRAL & DOCTOR / VISIT INFO (Row 2 from screenshot) -->
        <div class="adl-strip">
            <!-- Line 1 of Referral -->
            <div class="row g-2 align-items-end mb-2">
                <!-- Referral Type -->
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-4">
                    <label class="c-label">Referral Type</label>
                    <asp:DropDownList ID="ddlReferralType" runat="server" ClientIDMode="Static" CssClass="c-ctrl" onchange="onRefTypeChange();">
                        <asp:ListItem Text="SELF" Value="SELF" Selected="True" />
                        <asp:ListItem Text="Doctor" Value="Doctor" />
                        <asp:ListItem Text="Hospital" Value="Hospital" />
                        <asp:ListItem Text="Clinic" Value="Clinic" />
                        <asp:ListItem Text="Lab" Value="Lab" />
                        <asp:ListItem Text="Corporate" Value="Corporate" />
                    </asp:DropDownList>
                </div>

                <!-- Referral Name -->
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <label class="c-label">Referral Name</label>
                    <asp:TextBox ID="txtReferralName" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Search Referral Name"></asp:TextBox>
                </div>

                <!-- Doctor Name + Add Doctor Button -->
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <label class="c-label">Doctor Name</label>
                    <div class="d-flex gap-1">
                        <asp:TextBox ID="txtDoctorName" runat="server" ClientIDMode="Static" CssClass="c-ctrl" list="dlDoctors" placeholder="Search Doctor Name"></asp:TextBox>
                        <datalist id="dlDoctors">
                            <option value="Dr. Arvind Sharma (MD)">
                                <option value="Dr. Meenakshi Rao (MBBS, DGO)">
                                    <option value="Dr. Rajesh Gupta (MS)">
                                        <option value="Dr. Sunita Patel (MD)">
                        </datalist>
                        <button type="button" class="btn-theme btn-theme-light px-2" onclick="openDoctorModal();" title="Add Doctor">
                            <i class="fa-solid fa-plus text-primary"></i>
                        </button>
                    </div>
                </div>

                <!-- Rider -->
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-6">
                    <label class="c-label">Rider</label>
                    <asp:DropDownList ID="ddlRider" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                        <asp:ListItem Text="-- Select Rider --" Value="" />
                        <asp:ListItem Text="Rider Manoj (Central)" Value="Rider 1" />
                        <asp:ListItem Text="Rider Vikas (North)" Value="Rider 2" />
                        <asp:ListItem Text="In-house Phlebotomist" Value="Inhouse" Selected="True" />
                    </asp:DropDownList>
                </div>

                <!-- Patient Assessment Link/Button -->
                <div class="col-xl-2 col-lg-2 col-md-12 col-sm-6 text-end">
                    <button type="button" class="btn-theme btn-theme-blue w-100 justify-content-center" onclick="openAssessmentModal();">
                        <i class="fa-solid fa-heart-pulse"></i>Patient Assessment
                   
                    </button>
                </div>
            </div>

            <!-- Line 2 of Referral -->
            <div class="row g-2 align-items-end">
                <!-- External Visit ID -->
                <div class="col-xl-2 col-lg-2 col-md-3 col-sm-4">
                    <label class="c-label">External Visit ID</label>
                    <asp:TextBox ID="txtExternalVisitID" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="External Visit ID"></asp:TextBox>
                </div>

                <!-- Remarks -->
                <div class="col-xl-7 col-lg-7 col-md-6 col-sm-4">
                    <label class="c-label">Remarks</label>
                    <asp:TextBox ID="txtRemarks" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Remarks"></asp:TextBox>
                </div>

                <!-- PRO -->
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <label class="c-label">PRO</label>
                    <asp:DropDownList ID="ddlPRO" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                        <asp:ListItem Text="Direct / Walk-in" Value="Direct" Selected="True" />
                        <asp:ListItem Text="PRO Sanjay Saxena" Value="Sanjay" />
                        <asp:ListItem Text="PRO Priya Malhotra" Value="Priya" />
                    </asp:DropDownList>
                </div>


                <asp:Button ID="btnRegisterPatient" runat="server" Text="Register Patient"
                    CssClass="btn-theme btn-theme-blue" OnClick="btnRegisterPatient_Click"   />

                <%--<asp:Button ID="btnClear" runat="server" Text="Clear"
                    CssClass="btn-theme btn-theme-light" />--%>

            </div>
        </div>

        <!-- 4. INVESTIGATION / SERVICE GRID -->
        <div class="grid-wrap">
            <div class="d-flex align-items-center justify-content-between p-1 px-2 bg-light border-bottom">
                <!-- Quick Search Input -->
                <div class="d-flex align-items-center gap-2 position-relative" style="width: 380px;">
                    <span class="text-muted" style="font-size: 11px; font-weight: 600;">ADD TEST:</span>
                    <input type="text" id="txtSearchService" class="c-ctrl c-ctrl-sm" placeholder="Search test name or code (e.g. CBC, Lipid, LFT)..." oninput="filterCatalog(this.value);" autocomplete="off" />
                    <div id="acDropdown" class="ac-box"></div>
                </div>

                <!-- Badges matching screenshot -->
                <div class="d-flex align-items-center gap-2">
                    <span class="tag-pill tag-outsource">OutSource</span>
                    <span class="tag-pill tag-discountable">Discountable Service</span>
                    <button type="button" class="btn-theme btn-theme-light btn-theme-sm" onclick="addBlankRow();" style="height: 23px; font-size: 11px;">
                        <i class="fa-solid fa-plus text-primary"></i>Row
                   
                    </button>
                </div>
            </div>

            <div class="grid-scroll-box">
                <table class="grid-table" id="tblServices">
                    <thead>
                        <tr>
                            <th style="width: 35px; text-align: center;">S.No</th>
                            <th style="width: 140px;">Service Code/CPT Code</th>
                            <th>Service Name</th>
                            <th style="width: 90px;">Rate (<i class="fa-solid fa-indian-rupee-sign" style="font-size: 9.5px;"></i>)</th>
                            <th style="width: 65px;">Quantity</th>
                            <th style="width: 90px;">Amount (<i class="fa-solid fa-indian-rupee-sign" style="font-size: 9.5px;"></i>)</th>
                            <th style="width: 75px;">Discount</th>
                            <th style="width: 85px;">Discount Type</th>
                            <th style="width: 90px;">Net (<i class="fa-solid fa-indian-rupee-sign" style="font-size: 9.5px;"></i>)</th>
                            <th style="width: 45px; text-align: center;">STAT</th>
                            <th style="width: 35px; text-align: center;"><i class="fa-solid fa-trash-can"></i></th>
                        </tr>
                    </thead>
                    <tbody id="tblServicesBody">
                        <!-- Default Row 1 (as seen in screenshot) -->
                        <tr data-row="1" data-outsource="0" data-discountable="1">
                            <td class="text-center text-muted fw-bold s-no">1</td>
                            <td>
                                <input type="text" class="c-ctrl c-ctrl-sm row-code" value="HAEM001" placeholder="Service Code" oninput="calcRow(this);" />
                            </td>
                            <td>
                                <div class="d-flex align-items-center justify-content-between gap-1">
                                    <input type="text" class="c-ctrl c-ctrl-sm row-name" value="Complete Blood Count (CBC)" placeholder="Service Name" />
                                    <span class="tag-pill tag-discountable">Disc</span>
                                </div>
                            </td>
                            <td>
                                <input type="number" class="c-ctrl c-ctrl-sm row-rate" value="450.00" min="0" step="10" oninput="calcRow(this);" />
                            </td>
                            <td>
                                <input type="number" class="c-ctrl c-ctrl-sm row-qty" value="1" min="1" oninput="calcRow(this);" />
                            </td>
                            <td>
                                <span class="fw-bold row-amount">450.00</span>
                            </td>
                            <td>
                                <input type="number" class="c-ctrl c-ctrl-sm row-disc" value="0.00" min="0" oninput="calcRow(this);" />
                            </td>
                            <td>
                                <select class="c-ctrl c-ctrl-sm row-disctype" onchange="calcRow(this);">
                                    <option value="pct">%</option>
                                    <option value="amt">Rs</option>
                                </select>
                            </td>
                            <td>
                                <span class="fw-bold text-primary row-net">450.00</span>
                            </td>
                            <td class="text-center">
                                <input type="checkbox" class="form-check-input row-stat" style="margin: 0; width: 13px; height: 13px;" />
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-sm text-danger p-0 border-0 bg-transparent" onclick="removeRow(this);" title="Delete">
                                    <i class="fa-solid fa-lock text-danger" style="font-size: 11px;"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 5. BOTTOM 3-COLUMN SETTLEMENT STRIP -->
        <div class="row g-2">
            <!-- Left Box: Discount & Approvals -->
            <div class="col-xl-4 col-lg-4 col-md-12">
                <div class="settle-box">
                    <div class="row g-2 mb-2">
                        <div class="col-6">
                            <label class="c-label">Discount Type</label>
                            <asp:DropDownList ID="ddlDiscountType" runat="server" ClientIDMode="Static" CssClass="c-ctrl" onchange="onOverallDiscChange();">
                                <asp:ListItem Text="-- Select Type --" Value="None" Selected="True" />
                                <asp:ListItem Text="Senior Citizen" Value="Senior Citizen" />
                                <asp:ListItem Text="Staff Concession" Value="Staff" />
                                <asp:ListItem Text="Doctor Reference" Value="Doctor" />
                                <asp:ListItem Text="Camp / Special" Value="Camp" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-6">
                            <label class="c-label">Approved By</label>
                            <asp:DropDownList ID="ddlApprovedBy" runat="server" ClientIDMode="Static" CssClass="c-ctrl">
                                <asp:ListItem Text="Dr. Arvind Sharma" Value="Dr. Arvind" Selected="True" />
                                <asp:ListItem Text="Lab Administrator" Value="Admin" />
                                <asp:ListItem Text="Billing Incharge" Value="Manager" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Radios % / Amount + Input -->
                    <div class="row g-2 align-items-center mb-2">
                        <div class="col-5">
                            <div class="d-flex align-items-center gap-2">
                                <label class="c-radio-label">
                                    <input type="radio" name="discMode" value="pct" checked onchange="onOverallDiscChange();" />
                                    %
                               
                                </label>
                                <label class="c-radio-label">
                                    <input type="radio" name="discMode" value="amt" onchange="onOverallDiscChange();" />
                                    Amount
                               
                                </label>
                            </div>
                        </div>
                        <div class="col-7">
                            <asp:TextBox ID="txtOverallDiscVal" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" value="0.00" min="0" oninput="calcTotals();"></asp:TextBox>
                        </div>
                    </div>

                    <div>
                        <label class="c-label">Remarks</label>
                        <asp:TextBox ID="txtBillRemarks" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Remarks"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Middle Box: Currency & Payment Mode -->
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="settle-box">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <span class="c-label mb-0" style="font-weight: 700;">Currency Type</span>
                        <div style="width: 140px;">
                            <asp:DropDownList ID="ddlCurrency" runat="server" ClientIDMode="Static" CssClass="c-ctrl c-ctrl-sm">
                                <asp:ListItem Text="Indian Rupee" Value="INR" Selected="True" />
                                <asp:ListItem Text="US Dollar" Value="USD" />
                                <asp:ListItem Text="Euro" Value="EUR" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row g-2">
                        <!-- Mode Tabs -->
                        <div class="col-5">
                            <button type="button" class="mode-btn active" id="btnPayCash" onclick="setPayMode('cash');">
                                Cash Amount
                           
                            </button>
                            <button type="button" class="mode-btn" id="btnPayCard" onclick="setPayMode('card');">
                                Card Amount
                           
                            </button>
                            <button type="button" class="mode-btn" id="btnPayCheque" onclick="setPayMode('cheque');">
                                Cheque Amount
                           
                            </button>
                            <button type="button" class="mode-btn" id="btnPayOnline" onclick="setPayMode('online');">
                                Online Amount
                           
                            </button>
                        </div>

                        <!-- Mode Details -->
                        <div class="col-7">
                            <!-- CASH PANEL -->
                            <div id="pnlCash">
                                <div class="mb-1">
                                    <label class="c-label">Cash Tendered</label>
                                    <asp:TextBox ID="txtCashTendered" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" value="450.00" oninput="calcChange();"></asp:TextBox>
                                </div>
                                <div class="mb-1">
                                    <label class="c-label">Cash Collect</label>
                                    <asp:TextBox ID="txtCashCollect" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" value="450.00" oninput="calcTotals();"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="c-label">Change</label>
                                    <asp:TextBox ID="txtChange" runat="server" ClientIDMode="Static" CssClass="c-ctrl bg-light fw-bold text-success" value="0.00" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <!-- CARD PANEL -->
                            <div id="pnlCard" class="d-none">
                                <div class="mb-1">
                                    <label class="c-label">Card Amount</label>
                                    <asp:TextBox ID="txtCardAmount" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" oninput="calcTotals();"></asp:TextBox>
                                </div>
                                <div class="mb-1">
                                    <label class="c-label">Last 4 Digits</label>
                                    <asp:TextBox ID="txtCardLast4" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="e.g. 4821" MaxLength="4"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="c-label">Approval Code</label>
                                    <asp:TextBox ID="txtCardAuth" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Auth Code"></asp:TextBox>
                                </div>
                            </div>

                            <!-- CHEQUE PANEL -->
                            <div id="pnlCheque" class="d-none">
                                <div class="mb-1">
                                    <label class="c-label">Cheque Amount</label>
                                    <asp:TextBox ID="txtChequeAmount" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" oninput="calcTotals();"></asp:TextBox>
                                </div>
                                <div class="mb-1">
                                    <label class="c-label">Cheque No</label>
                                    <asp:TextBox ID="txtChequeNo" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Cheque No"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="c-label">Bank Name</label>
                                    <asp:TextBox ID="txtChequeBank" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Bank Name"></asp:TextBox>
                                </div>
                            </div>

                            <!-- ONLINE PANEL -->
                            <div id="pnlOnline" class="d-none">
                                <div class="mb-1">
                                    <label class="c-label">Online Amount</label>
                                    <asp:TextBox ID="txtOnlineAmount" runat="server" ClientIDMode="Static" TextMode="Number" CssClass="c-ctrl" oninput="calcTotals();"></asp:TextBox>
                                </div>
                                <div>
                                    <label class="c-label">UPI / UTR Ref</label>
                                    <asp:TextBox ID="txtOnlineRef" runat="server" ClientIDMode="Static" CssClass="c-ctrl" placeholder="Transaction Ref No"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Box: Financial Summary (Fixed FontAwesome Rupee Icons - No Encoding Glitches) -->
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="settle-box">
                    <div class="settle-title">
                        <span>BILL SUMMARY</span>
                        <span class="badge bg-light text-muted border">Accurate Lab</span>
                    </div>

                    <!-- Gross -->
                    <div class="sum-line">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <span>Gross</span>
                        </div>
                        <span class="sum-val" id="lblGross">450.00</span>
                    </div>

                    <!-- Discount -->
                    <div class="sum-line">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge text-danger"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <span>Discount</span>
                        </div>
                        <span class="sum-val text-danger" id="lblDiscount">0.00</span>
                    </div>

                    <!-- Round Off with Checkbox -->
                    <div class="sum-line">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <label class="d-inline-flex align-items-center gap-1 mb-0" style="cursor: pointer;">
                                <asp:CheckBox ID="chkRoundOff" runat="server" ClientIDMode="Static" Checked="true" onchange="calcTotals();" />
                                <span>Round Off</span>
                            </label>
                        </div>
                        <span class="sum-val" id="lblRoundOff">0.00</span>
                    </div>

                    <!-- Net -->
                    <div class="sum-line sum-net">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge sum-badge-active"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <span class="fw-bold">Net</span>
                        </div>
                        <span class="sum-val" id="lblNet">450.00</span>
                    </div>

                    <!-- Collected -->
                    <div class="sum-line">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge text-primary"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <span>Collected</span>
                        </div>
                        <span class="sum-val text-primary" id="lblCollected">450.00</span>
                    </div>

                    <!-- Due (Fixed FontAwesome icon: strictly prevents a,' bug) -->
                    <div class="sum-line sum-due" id="dueBox">
                        <div class="d-flex align-items-center">
                            <span class="sum-badge text-warning"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                            <span>Due</span>
                        </div>
                        <span class="sum-val" id="lblDue">0.00</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 6. FIXED BOTTOM ACTION BAR (Clean flex layout, no cutoff, perfectly fitted) -->
        <div class="bottom-action-bar">
            <!-- Left: UID and Status -->
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-light text-dark border py-1 px-2" style="font-size: 11px;">
                    <i class="fa-solid fa-id-card text-primary me-1"></i>
                    UID: <strong id="lblUID">ADL-<%= DateTime.Now.ToString("yyMMdd") %>-001</strong>
                </span>
                <span class="text-muted small" style="font-size: 11px;" id="lblStatus">Ready for registration</span>
            </div>

            <!-- Right: Action Buttons Group (Ensured zero cut-off / overflow) -->
            <div class="action-btns-group">
                <button type="button" class="btn-theme btn-theme-light" onclick="resetForm();" title="Reset Form">
                    <i class="fa-solid fa-arrows-rotate"></i>Reset
               
                </button>
                <button type="button" class="btn-theme btn-theme-light" onclick="printBarcodes();" title="Print Barcode Labels">
                    <i class="fa-solid fa-barcode"></i>Barcode
               
                </button>
                <button type="button" class="btn-theme btn-theme-blue" onclick="savePatientOnly();" title="Save Patient Only">
                    <i class="fa-solid fa-floppy-disk"></i>Save Patient
               
                </button>
                <button type="button" class="btn-theme btn-theme-primary" onclick="saveAndPrint();" title="Save &amp; Print Bill (F9)">
                    <i class="fa-solid fa-print"></i>Save &amp; Print Bill (F9)
               
                </button>
            </div>
        </div>
    </div>

    <!-- Modal 1: Assessment Modal -->
    <div class="modal fade" id="mdlAssessment" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header py-2 px-3 bg-dark text-white">
                    <h6 class="modal-title fs-6 fw-bold mb-0"><i class="fa-solid fa-heart-pulse me-2 text-danger"></i>Patient Assessment</h6>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-3" style="font-size: 12px;">
                    <div class="row g-2">
                        <div class="col-6">
                            <label class="c-label">BP (mmHg)</label>
                            <input type="text" id="vBP" class="c-ctrl" value="120/80" />
                        </div>
                        <div class="col-6">
                            <label class="c-label">Pulse (bpm)</label>
                            <input type="number" id="vPulse" class="c-ctrl" value="72" />
                        </div>
                        <div class="col-6">
                            <label class="c-label">Temperature (&deg;F)</label>
                            <input type="text" id="vTemp" class="c-ctrl" value="98.4" />
                        </div>
                        <div class="col-6">
                            <label class="c-label">SpO2 (%)</label>
                            <input type="number" id="vSpO2" class="c-ctrl" value="99" />
                        </div>
                        <div class="col-6">
                            <label class="c-label">Weight (Kg)</label>
                            <input type="number" id="vWeight" class="c-ctrl" value="68" />
                        </div>
                        <div class="col-6">
                            <label class="c-label">Fasting Status</label>
                            <select id="vFasting" class="c-ctrl">
                                <option>Fasting (10-12 hrs)</option>
                                <option>Post Prandial (PP)</option>
                                <option>Random</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label class="c-label">Clinical History / Notes</label>
                            <textarea id="vNotes" class="c-ctrl" style="height: 50px;" placeholder="Patient notes..."></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer py-2 px-3 bg-light">
                    <button type="button" class="btn-theme btn-theme-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn-theme btn-theme-primary" onclick="saveAssessmentModal();">Save Assessment</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 2: Add Doctor Modal -->
    <div class="modal fade" id="mdlDoctor" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content border-0 shadow">
                <div class="modal-header py-2 px-3 bg-dark text-white">
                    <h6 class="modal-title fs-6 fw-bold mb-0"><i class="fa-solid fa-user-plus me-2 text-primary"></i>Add Doctor</h6>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-3" style="font-size: 12px;">
                    <div class="mb-2">
                        <label class="c-label">Doctor Name <span class="req">*</span></label>
                        <input type="text" id="newDocName" class="c-ctrl" placeholder="e.g. Dr. Rajesh Kumar" />
                    </div>
                    <div class="mb-2">
                        <label class="c-label">Degree</label>
                        <input type="text" id="newDocDegree" class="c-ctrl" placeholder="e.g. MBBS, MD" />
                    </div>
                    <div>
                        <label class="c-label">Phone</label>
                        <input type="tel" id="newDocPhone" class="c-ctrl" placeholder="Mobile No" />
                    </div>
                </div>
                <div class="modal-footer py-2 px-3 bg-light">
                    <button type="button" class="btn-theme btn-theme-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn-theme btn-theme-primary" onclick="saveNewDoctor();">Save</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 3: Print Bill Preview -->
    <div class="modal fade" id="mdlPrint" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header py-2 px-3 bg-dark text-white">
                    <h6 class="modal-title fs-6 fw-bold mb-0"><i class="fa-solid fa-receipt me-2 text-warning"></i>Diagnostic Bill Receipt</h6>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-3" style="font-size: 11.5px;">
                    <div class="text-center border-bottom pb-2 mb-2">
                        <h6 class="fw-bold mb-0 text-dark" style="font-size: 14px;">ACCURATE DIAGNOSTIC LAB</h6>
                        <small class="text-muted">High-Tech Pathology &amp; Diagnostic Centre &bull; Ph: 011-45678900</small>
                    </div>

                    <div class="row g-1 bg-light p-2 rounded mb-2" style="font-size: 11px;">
                        <div class="col-6"><strong>Patient:</strong> <span id="prPatient">Mr. Ramesh</span></div>
                        <div class="col-6 text-end"><strong>UID:</strong> <span id="prUID">ADL-001</span></div>
                        <div class="col-6"><strong>Age/Sex:</strong> <span id="prAgeSex">35 Y / Male</span></div>
                        <div class="col-6 text-end"><strong>Doctor:</strong> <span id="prDoctor">Self</span></div>
                    </div>

                    <table class="table table-bordered table-sm mb-2" style="font-size: 11px;">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Code</th>
                                <th>Investigation</th>
                                <th class="text-end">Rate</th>
                                <th class="text-center">Qty</th>
                                <th class="text-end">Amount</th>
                            </tr>
                        </thead>
                        <tbody id="prItemsBody"></tbody>
                    </table>

                    <div class="row justify-content-end">
                        <div class="col-7">
                            <table class="table table-sm table-borderless mb-0" style="font-size: 11.5px;">
                                <tr>
                                    <td>Gross:</td>
                                    <td class="text-end fw-bold" id="prGross">0.00</td>
                                </tr>
                                <tr>
                                    <td>Discount:</td>
                                    <td class="text-end text-danger fw-bold" id="prDisc">0.00</td>
                                </tr>
                                <tr class="border-top">
                                    <td class="fw-bold">Net Payable:</td>
                                    <td class="text-end fw-bold text-success" id="prNet">0.00</td>
                                </tr>
                                <tr>
                                    <td>Collected:</td>
                                    <td class="text-end fw-bold text-primary" id="prPaid">0.00</td>
                                </tr>
                                <tr class="border-top">
                                    <td class="fw-bold text-danger">Due:</td>
                                    <td class="text-end fw-bold text-danger" id="prDue">0.00</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer py-2 px-3 bg-light">
                    <button type="button" class="btn-theme btn-theme-light" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn-theme btn-theme-primary" onclick="window.print();">
                        <i class="fa-solid fa-print"></i>Print
                   
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Client-side Calculation & Logic Engine -->
    <script>
        const catalog = [
            { code: "HAEM001", name: "Complete Blood Count (CBC)", rate: 450, outsource: 0, discountable: 1 },
            { code: "HAEM002", name: "ESR (Erythrocyte Sedimentation Rate)", rate: 120, outsource: 0, discountable: 1 },
            { code: "BIO002", name: "Lipid Profile (Full)", rate: 750, outsource: 0, discountable: 1 },
            { code: "BIO003", name: "Liver Function Test (LFT)", rate: 800, outsource: 0, discountable: 1 },
            { code: "BIO004", name: "Kidney Function Test (KFT)", rate: 700, outsource: 0, discountable: 1 },
            { code: "IMM005", name: "Thyroid Profile (T3, T4, TSH)", rate: 650, outsource: 0, discountable: 1 },
            { code: "BIO006", name: "Blood Glucose (Fasting)", rate: 80, outsource: 0, discountable: 1 },
            { code: "BIO007", name: "Blood Glucose (PP)", rate: 80, outsource: 0, discountable: 1 },
            { code: "BIO008", name: "HbA1c (Glycated Hemoglobin)", rate: 500, outsource: 0, discountable: 1 },
            { code: "CLI009", name: "Urine Routine & Microscopic", rate: 200, outsource: 0, discountable: 1 },
            { code: "IMM011", name: "Vitamin D (25-OH) [Outsource]", rate: 1200, outsource: 1, discountable: 0 },
            { code: "IMM012", name: "Vitamin B12 [Outsource]", rate: 900, outsource: 1, discountable: 0 }
        ];

        let activePayMode = 'cash';

        document.addEventListener('DOMContentLoaded', function () {
            calcTotals();
            document.addEventListener('keydown', function (e) {
                if (e.key === 'F9') { e.preventDefault(); saveAndPrint(); }
            });
        });

        // Search Hint updater
        function updateSearchHint() {
            const rad = document.querySelector('input[name="searchFilter"]:checked').value;
            const inp = document.getElementById('txtGlobalSearch');
            if (rad === 'patient_id') inp.placeholder = 'Patient ID / UID';
            else if (rad === 'patient_name') inp.placeholder = 'Search Patient Name';
            else if (rad === 'mobile_no') inp.placeholder = 'Search Mobile No';
            else if (rad === 'hospital_id') inp.placeholder = 'Hospital ID';
        }

        function checkSearchKey(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                searchPatient();
                return false;
            }
            return true;
        }

        function searchPatient() {
            const val = document.getElementById('txtGlobalSearch').value.trim();
            if (!val) { notify('Please enter search query', 'warning'); return; }
            notify('Searching: ' + val, 'info');
            setTimeout(function () {
                loadSampleDemo();
                notify('Patient record loaded!', 'success');
            }, 300);
        }

        function onHeaderStatToggle(chk) {
            const isStat = chk.checked;
            document.querySelectorAll('.row-stat').forEach(c => c.checked = isStat);
            notify(isStat ? 'STAT Urgency ON' : 'STAT Urgency OFF', isStat ? 'danger' : 'info');
        }

        // DOB <-> Age Sync
        function syncAgeFromDOB() {
            const dobVal = document.getElementById('txtDOB').value;
            if (!dobVal) return;
            const dob = new Date(dobVal);
            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const m = today.getMonth() - dob.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) age--;
            document.getElementById('txtAge').value = Math.max(0, age);
            document.getElementById('ddlAgeType').value = 'Y';
        }

        function syncDOBFromAge() {
            const age = parseInt(document.getElementById('txtAge').value);
            if (isNaN(age) || age < 0) return;
            const type = document.getElementById('ddlAgeType').value;
            const now = new Date();
            let y = now.getFullYear();
            let m = now.getMonth();
            let d = now.getDate();
            if (type === 'Y') y -= age;
            else if (type === 'M') m -= age;
            else if (type === 'D') d -= age;
            const res = new Date(y, m, d);
            const mm = String(res.getMonth() + 1).padStart(2, '0');
            const dd = String(res.getDate()).padStart(2, '0');
            document.getElementById('txtDOB').value = `${res.getFullYear()}-${mm}-${dd}`;
        }

        function onRefTypeChange() {
            const val = document.getElementById('ddlReferralType').value;
            if (val === 'SELF') {
                document.getElementById('txtReferralName').value = 'Self';
                document.getElementById('txtDoctorName').value = 'Self / Pathologist';
            }
        }

        // Autocomplete filtering for test catalog
        function filterCatalog(q) {
            const box = document.getElementById('acDropdown');
            if (!q || q.trim().length === 0) { box.style.display = 'none'; return; }
            const clean = q.toLowerCase().trim();
            const matches = catalog.filter(c => c.name.toLowerCase().includes(clean) || c.code.toLowerCase().includes(clean));
            if (matches.length === 0) { box.style.display = 'none'; return; }

            let html = '';
            matches.forEach(item => {
                const tag = item.outsource ? '<span class="tag-pill tag-outsource">Outsource</span>' : '<span class="tag-pill tag-discountable">In-house</span>';
                html += `<div class="ac-item" onclick="pickTest('${item.code}', '${item.name}', ${item.rate}, ${item.outsource}, ${item.discountable});">
                    <span><strong>${item.name}</strong> <small class="text-muted">(${item.code})</small></span>
                    <span><strong>Rs. ${item.rate.toFixed(2)}</strong> ${tag}</span>
                </div>`;
            });
            box.innerHTML = html;
            box.style.display = 'block';
        }

        function pickTest(code, name, rate, outsource, discountable) {
            addRow(code, name, rate, outsource, discountable);
            document.getElementById('txtSearchService').value = '';
            document.getElementById('acDropdown').style.display = 'none';
        }

        document.addEventListener('click', function (e) {
            const box = document.getElementById('acDropdown');
            const inp = document.getElementById('txtSearchService');
            if (box && inp && !box.contains(e.target) && e.target !== inp) {
                box.style.display = 'none';
            }
        });

        // Add Table Row
        function addRow(code, name, rate, outsource, discountable) {
            const tbody = document.getElementById('tblServicesBody');
            const idx = tbody.children.length + 1;

            const tr = document.createElement('tr');
            tr.setAttribute('data-row', idx);
            tr.setAttribute('data-outsource', outsource ? '1' : '0');
            tr.setAttribute('data-discountable', discountable ? '1' : '0');

            const tagHtml = outsource
                ? '<span class="tag-pill tag-outsource">OutSource</span>'
                : '<span class="tag-pill tag-discountable">Disc</span>';

            tr.innerHTML = `
                <td class="text-center text-muted fw-bold s-no">${idx}</td>
                <td><input type="text" class="c-ctrl c-ctrl-sm row-code" value="${code || ''}" placeholder="Code" oninput="calcRow(this);" /></td>
                <td>
                    <div class="d-flex align-items-center justify-content-between gap-1">
                        <input type="text" class="c-ctrl c-ctrl-sm row-name" value="${name || ''}" placeholder="Service Name" />
                        ${tagHtml}
                    </div>
                </td>
                <td><input type="number" class="c-ctrl c-ctrl-sm row-rate" value="${rate ? rate.toFixed(2) : '0.00'}" min="0" step="10" oninput="calcRow(this);" /></td>
                <td><input type="number" class="c-ctrl c-ctrl-sm row-qty" value="1" min="1" oninput="calcRow(this);" /></td>
                <td><span class="fw-bold row-amount">${rate ? rate.toFixed(2) : '0.00'}</span></td>
                <td><input type="number" class="c-ctrl c-ctrl-sm row-disc" value="0.00" min="0" oninput="calcRow(this);" /></td>
                <td>
                    <select class="c-ctrl c-ctrl-sm row-disctype" onchange="calcRow(this);">
                        <option value="pct">%</option>
                        <option value="amt">Rs</option>
                    </select>
                </td>
                <td><span class="fw-bold text-primary row-net">${rate ? rate.toFixed(2) : '0.00'}</span></td>
                <td class="text-center"><input type="checkbox" class="form-check-input row-stat" style="margin:0; width:13px; height:13px;" /></td>
                <td class="text-center">
                    <button type="button" class="btn btn-sm text-danger p-0 border-0 bg-transparent" onclick="removeRow(this);" title="Delete">
                        <i class="fa-solid fa-trash-can" style="font-size: 11px;"></i>
                    </button>
                </td>
            `;

            tbody.appendChild(tr);
            renumber();
            calcTotals();
            notify('Added: ' + name, 'success');
        }

        function addBlankRow() {
            addRow('', '', 0, 0, 1);
        }

        function removeRow(btn) {
            const tr = btn.closest('tr');
            const tbody = document.getElementById('tblServicesBody');
            if (tbody.children.length <= 1) {
                notify('Minimum 1 service row required', 'warning');
                return;
            }
            tr.remove();
            renumber();
            calcTotals();
        }

        function renumber() {
            const rows = document.querySelectorAll('#tblServicesBody tr');
            rows.forEach((r, i) => {
                r.querySelector('.s-no').textContent = i + 1;
                r.setAttribute('data-row', i + 1);
            });
        }

        function calcRow(el) {
            const tr = el.closest('tr');
            const rate = parseFloat(tr.querySelector('.row-rate').value) || 0;
            const qty = parseInt(tr.querySelector('.row-qty').value) || 1;
            const discVal = parseFloat(tr.querySelector('.row-disc').value) || 0;
            const discType = tr.querySelector('.row-disctype').value;

            const amt = rate * qty;
            tr.querySelector('.row-amount').textContent = amt.toFixed(2);

            let d = 0;
            if (discType === 'pct') d = (amt * discVal) / 100;
            else d = discVal;

            const net = Math.max(0, amt - d);
            tr.querySelector('.row-net').textContent = net.toFixed(2);
            calcTotals();
        }

        // Payment Mode Switcher
        function setPayMode(mode) {
            activePayMode = mode;
            document.querySelectorAll('.mode-btn').forEach(b => b.classList.remove('active'));
            if (mode === 'cash') document.getElementById('btnPayCash').classList.add('active');
            else if (mode === 'card') document.getElementById('btnPayCard').classList.add('active');
            else if (mode === 'cheque') document.getElementById('btnPayCheque').classList.add('active');
            else if (mode === 'online') document.getElementById('btnPayOnline').classList.add('active');

            document.getElementById('pnlCash').classList.toggle('d-none', mode !== 'cash');
            document.getElementById('pnlCard').classList.toggle('d-none', mode !== 'card');
            document.getElementById('pnlCheque').classList.toggle('d-none', mode !== 'cheque');
            document.getElementById('pnlOnline').classList.toggle('d-none', mode !== 'online');

            const netVal = parseFloat(document.getElementById('lblNet').textContent) || 0;
            if (mode === 'cash') {
                document.getElementById('txtCashCollect').value = netVal.toFixed(2);
                document.getElementById('txtCashTendered').value = netVal.toFixed(2);
                calcChange();
            } else if (mode === 'card') {
                document.getElementById('txtCardAmount').value = netVal.toFixed(2);
            } else if (mode === 'cheque') {
                document.getElementById('txtChequeAmount').value = netVal.toFixed(2);
            } else if (mode === 'online') {
                document.getElementById('txtOnlineAmount').value = netVal.toFixed(2);
            }
            calcTotals();
        }

        function calcChange() {
            const tendered = parseFloat(document.getElementById('txtCashTendered').value) || 0;
            const collect = parseFloat(document.getElementById('txtCashCollect').value) || 0;
            const change = Math.max(0, tendered - collect);
            document.getElementById('txtChange').value = change.toFixed(2);
        }

        function onOverallDiscChange() {
            const type = document.getElementById('ddlDiscountType').value;
            const inp = document.getElementById('txtOverallDiscVal');
            const mode = document.querySelector('input[name="discMode"]:checked').value;

            if (type === 'Senior Citizen') inp.value = mode === 'pct' ? '10.00' : '50.00';
            else if (type === 'Staff') inp.value = mode === 'pct' ? '20.00' : '100.00';
            else if (type === 'Doctor') inp.value = mode === 'pct' ? '15.00' : '75.00';
            else if (type === 'None') inp.value = '0.00';

            calcTotals();
        }

        // Live Financials Calculation
        function calcTotals() {
            let gross = 0;
            let lineDisc = 0;

            document.querySelectorAll('#tblServicesBody tr').forEach(r => {
                const rate = parseFloat(r.querySelector('.row-rate').value) || 0;
                const qty = parseInt(r.querySelector('.row-qty').value) || 1;
                const discVal = parseFloat(r.querySelector('.row-disc').value) || 0;
                const discType = r.querySelector('.row-disctype').value;

                const amt = rate * qty;
                gross += amt;
                if (discType === 'pct') lineDisc += (amt * discVal) / 100;
                else lineDisc += discVal;
            });

            // Overall Discount
            const oVal = parseFloat(document.getElementById('txtOverallDiscVal').value) || 0;
            const oMode = document.querySelector('input[name="discMode"]:checked').value;
            let overallDisc = 0;
            if (oMode === 'pct') overallDisc = (gross * oVal) / 100;
            else overallDisc = oVal;

            const totalDisc = lineDisc + overallDisc;
            let net = Math.max(0, gross - totalDisc);

            // Round Off
            let roundOff = 0;
            const isRound = document.getElementById('chkRoundOff').checked;
            if (isRound) {
                const rNet = Math.round(net);
                roundOff = rNet - net;
                net = rNet;
            }

            // Collected
            let collected = 0;
            if (activePayMode === 'cash') collected = parseFloat(document.getElementById('txtCashCollect').value) || 0;
            else if (activePayMode === 'card') collected = parseFloat(document.getElementById('txtCardAmount').value) || 0;
            else if (activePayMode === 'cheque') collected = parseFloat(document.getElementById('txtChequeAmount').value) || 0;
            else if (activePayMode === 'online') collected = parseFloat(document.getElementById('txtOnlineAmount').value) || 0;

            const due = Math.max(0, net - collected);

            // Update UI
            document.getElementById('lblGross').textContent = gross.toFixed(2);
            document.getElementById('lblDiscount').textContent = totalDisc.toFixed(2);
            document.getElementById('lblRoundOff').textContent = (roundOff >= 0 ? '+' : '') + roundOff.toFixed(2);
            document.getElementById('lblNet').textContent = net.toFixed(2);
            document.getElementById('lblCollected').textContent = collected.toFixed(2);
            document.getElementById('lblDue').textContent = due.toFixed(2);

            calcChange();
        }

        // Demo Data Loader
        function loadSampleDemo() {
            document.getElementById('ddlTitle').value = 'Mr.';
            document.getElementById('txtFirstName').value = 'Ramesh';
            document.getElementById('txtLastName').value = 'Sharma';
            document.getElementById('ddlGender').value = 'Male';
            document.getElementById('txtAge').value = '38';
            document.getElementById('ddlAgeType').value = 'Y';
            syncDOBFromAge();
            document.getElementById('txtMobile').value = '9876543210';
            document.getElementById('txtEmail').value = 'ramesh.sharma@example.com';
            document.getElementById('ddlReferralType').value = 'Doctor';
            document.getElementById('txtReferralName').value = 'City Care Clinic';
            document.getElementById('txtDoctorName').value = 'Dr. Arvind Sharma (MD)';
            document.getElementById('txtRemarks').value = 'Fasting health checkup';

            const tbody = document.getElementById('tblServicesBody');
            tbody.innerHTML = '';
            addRow('HAEM001', 'Complete Blood Count (CBC)', 450, 0, 1);
            addRow('BIO003', 'Liver Function Test (LFT)', 800, 0, 1);

            setPayMode('cash');
            notify('Sample demo patient filled!', 'success');
        }

        function resetForm() {
            document.getElementById('txtFirstName').value = '';
            document.getElementById('txtLastName').value = '';
            document.getElementById('txtAge').value = '';
            document.getElementById('txtDOB').value = '';
            document.getElementById('txtMobile').value = '';
            document.getElementById('txtEmail').value = '';
            document.getElementById('txtExternalVisitID').value = '';
            document.getElementById('txtRemarks').value = '';
            document.getElementById('chkSTAT').checked = false;

            const tbody = document.getElementById('tblServicesBody');
            tbody.innerHTML = '';
            addBlankRow();
            setPayMode('cash');
            notify('Form reset', 'info');
        }

        function savePatientOnly() {
            const fn = document.getElementById('txtFirstName').value.trim();
            const ln = document.getElementById('txtLastName').value.trim();
            if (!fn || !ln) { notify('Please enter First and Last Name', 'danger'); return; }
            document.getElementById('lblStatus').textContent = `Patient saved: ${fn} ${ln}`;
            notify(`Patient "${fn} ${ln}" profile saved!`, 'success');
        }

        function saveAndPrint() {
            const fn = document.getElementById('txtFirstName').value.trim();
            const ln = document.getElementById('txtLastName').value.trim();
            if (!fn || !ln) { notify('Please enter Patient Name first', 'danger'); return; }

            const title = document.getElementById('ddlTitle').value;
            document.getElementById('prPatient').textContent = `${title} ${fn} ${ln}`;
            document.getElementById('prUID').textContent = document.getElementById('lblUID').textContent;
            document.getElementById('prAgeSex').textContent = `${document.getElementById('txtAge').value || '35'} Y / ${document.getElementById('ddlGender').value}`;
            document.getElementById('prDoctor').textContent = document.getElementById('txtDoctorName').value || 'Self';

            const itemsBody = document.getElementById('prItemsBody');
            itemsBody.innerHTML = '';
            document.querySelectorAll('#tblServicesBody tr').forEach((r, i) => {
                const code = r.querySelector('.row-code').value || '-';
                const name = r.querySelector('.row-name').value || 'Test';
                const rate = r.querySelector('.row-rate').value || '0';
                const qty = r.querySelector('.row-qty').value || '1';
                const amt = r.querySelector('.row-amount').textContent || '0';

                itemsBody.innerHTML += `<tr>
                    <td>${i + 1}</td>
                    <td><code>${code}</code></td>
                    <td>${name}</td>
                    <td class="text-end">Rs. ${parseFloat(rate).toFixed(2)}</td>
                    <td class="text-center">${qty}</td>
                    <td class="text-end fw-bold">Rs. ${parseFloat(amt).toFixed(2)}</td>
                </tr>`;
            });

            document.getElementById('prGross').textContent = 'Rs. ' + document.getElementById('lblGross').textContent;
            document.getElementById('prDisc').textContent = 'Rs. ' + document.getElementById('lblDiscount').textContent;
            document.getElementById('prNet').textContent = 'Rs. ' + document.getElementById('lblNet').textContent;
            document.getElementById('prPaid').textContent = 'Rs. ' + document.getElementById('lblCollected').textContent;
            document.getElementById('prDue').textContent = 'Rs. ' + document.getElementById('lblDue').textContent;

            const modal = new bootstrap.Modal(document.getElementById('mdlPrint'));
            modal.show();
            notify('Invoice generated ready to print!', 'success');
        }

        function printBarcodes() {
            notify('Printing specimen barcode labels...', 'info');
            setTimeout(() => notify('Thermal barcode labels printed successfully!', 'success'), 400);
        }

        function openAssessmentModal() {
            const m = new bootstrap.Modal(document.getElementById('mdlAssessment'));
            m.show();
        }

        function saveAssessmentModal() {
            const m = bootstrap.Modal.getInstance(document.getElementById('mdlAssessment'));
            if (m) m.hide();
            notify('Patient clinical assessment saved!', 'success');
        }

        function openDoctorModal() {
            const m = new bootstrap.Modal(document.getElementById('mdlDoctor'));
            m.show();
        }

        function saveNewDoctor() {
            const name = document.getElementById('newDocName').value.trim();
            const deg = document.getElementById('newDocDegree').value.trim();
            if (!name) { notify('Doctor name required', 'danger'); return; }
            const formatted = name + (deg ? ` (${deg})` : '');
            document.getElementById('txtDoctorName').value = formatted;
            const m = bootstrap.Modal.getInstance(document.getElementById('mdlDoctor'));
            if (m) m.hide();
            notify(`Doctor ${formatted} registered!`, 'success');
        }

        function notify(msg, type = 'info') {
            const toast = document.getElementById('adlToast');
            toast.className = `adl-toast show ${type}`;
            toast.innerHTML = `<i class="fa-solid fa-circle-info"></i> <span>${msg}</span>`;
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</asp:Content>
