<style>
.modal-lg {
    width: 90%;
    max-width: 1200px;
}

.select2-container {
    width: 100% !important;
}

.modal-body {
    max-height: 80vh;
    overflow-y: auto;
}

.form-control {
    margin-bottom: 10px;
}

.row {
    margin-bottom: 15px;
}

label {
    padding-top: 7px;
}

.vertical-middle {
    vertical-align: middle !important;
}

.table th {
    padding: 12px 8px !important;  /* Increased padding */
}

/* Specific column widths */
.table th.col-id {
    min-width: 120px;
    width: 120px;
}

.table th.col-buyer {
    min-width: 150px;
    width: 150px;
}
.table th.col-qty {
    min-width: 50px;
    width: 50px;
}

.table th.col-date {
    min-width: 100px;
    width: 100px;
}

.table th.col-code {
    min-width: 130px;
    width: 130px;
}

.table th.col-desc {
    min-width: 270px;
    width: 270px;
}

.history-list {
    max-height: 200px;
    overflow-y: auto;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.history-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px 0;
    border-bottom: 1px solid #eee;
}

.history-item:last-child {
    border-bottom: none;
}

.btn-danger.btn-sm {
    padding: 2px 8px;
    font-size: 12px;
    margin-left: 10px;
}
</style>



<div class="col-md-12">
    <p><?php echo $title;?></p>
</div>

<div class="col-md-12" style="margin-top:10px;">
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="setpi();">Tambah</button><br><br>
</div>

<!--MODAL-->
<form id="form-ppic-pi">
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Tambah Data PPIC PI</h4>
            </div>
            <div class="modal-body" style="padding: 20px;">
                <div class="row">
                    <div id="alert-form-ppicpi"></div>
                </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">PI</label>
                    <div class="col-md-10">
                        <select class="form-control select2-container" name="d_pi" id="pilih_pi" onchange="detailPI();" required></select>
                    </div>
                </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty</label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="qty" required readonly>
                    </div>
                    <div class="col-md-3">
                        <label class="text-uppercase" id="satuan"></label>
                    </div>
                </div>

                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Cabang</label>
                    <div class="col-md-10">
                        <select class="form-control" name="cabang" id="cabang" required>
                            <option value="">(Pilih)</option>
                            <option value="LB UNGARAN">LB UNGARAN</option>
                            <option value="LB JOGJA">LB JOGJA</option>
                            <option value="LB CIREBON">LB CIREBON</option>
                            <option value="LB SAF">LB SAF</option>
                            <option value="LB ARA">LB ARA</option>
                            <option value="LB LAMBIENCE">LB LAMBIENCE</option>
                            <option value="LB PUTRA JAMBU">LB PUTRA JAMBU</option>
                        </select>
                    </div>
                </div>

<!----------------------ACTUAL--------------------------------------------------------->
                <!-- Add this after the existing section container -->
                <div class="section-actual-container">
                    <div class="row" style="margin-top:10px;">
                        <label class="col-md-2 text-uppercase">Section Actual</label>
                        <div class="col-md-10">
                            <select class="form-control" name="section_actual" id="section_actual" onchange="showSubSectionActual();" required>
                                <option value="">(Pilih)</option>
                                <option value="PREPARATION">PREPARATION</option>
                                <option value="PRODUCTION">PRODUCTION</option>
                                <option value="WAREHOUSING">WAREHOUSING & SHIPPING</option>
                            </select>
                        </div>
                    </div>
                </div>


        <!-- PREPARATION ACTUAL-->
        <div id="preparation_section_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Preparation Type</label>
                <div class="col-md-10">
                    <select class="form-control" name="preparation_type_actual" id="preparation_type_actual" onchange="showPreparationActualOptions();">
                        <option value="">(Pilih)</option>
                        <option value="KdHbSprt">KD/HB/SEMPROT</option>
                    </select>
                </div>
            </div>
        </div>

        <div id="preparation_timing_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Timing</label>
                <div class="col-md-10">
                    <select class="form-control" name="preparation_timing" id="preparation_timing" onchange="showPreparationDateInput();">
                        <option value="">(Pilih)</option>
                        <option value="mulai">Mulai Actual</option>
                        <option value="selesai">Selesai Actual</option>
                    </select>
                </div>
            </div>
        </div>

        <div id="preparation_date_mulai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglKdHbSprtMulaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">QTY Mulai Actual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyKdHbSprtMulaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>
            <!-- Add this new div for history -->
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Masuk</label>
                <div class="col-md-10">
                    <div id="kd_hb_history" class="well well-sm" style="display:none;">
                        <!-- History will be populated here -->
                    </div>
                </div>
            </div>
        </div>

        <div id="preparation_date_selesai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglKdHbSprtSelesaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">QTY Selesai Actual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyKdHbSprtSelesaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>
            <!-- For KD/HB Selesai -->
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Selesai</label>
                <div class="col-md-10">
                    <div id="kd_hb_selesai_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <!-- Production Actual Section -->
        <div id="production_section_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Production Type</label>
                <div class="col-md-10">
                    <select class="form-control" name="production_type_actual" id="production_type_actual" onchange="showProductionActualOptions();">
                        <option value="">(Pilih)</option>
                        <option value="Pembahanan">Pembahanan</option>
                        <option value="Finishing">Finishing</option>
                        <option value="Fitting">Fitting</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Production Timing Options -->
        <div id="production_timing_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Timing</label>
                <div class="col-md-10">
                    <select class="form-control" name="production_timing" id="production_timing" onchange="showProductionDateInput();">
                        <option value="">(Pilih)</option>
                        <option value="mulai">Mulai Actual</option>
                        <option value="selesai">Selesai Actual</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Date Input Sections -->
        <div id="pembahanan_date_mulai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Pemb Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglPembMulaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">QTY Mulai Actual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyPembMulaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>
            <!-- For Pembahanan -->
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Pembahanan</label>
                <div class="col-md-10">
                    <div id="pembahanan_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="pembahanan_date_selesai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Pemb Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglPembSelesaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">QTY Selesai Actual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyPembSelesaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>
            <!-- For Pembahanan Selesai -->
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Pembahanan Selesai</label>
                <div class="col-md-10">
                    <div id="pembahanan_selesai_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="finishing_date_mulai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Finish Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglFinMulaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Qty Finish Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyFinMulaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>

            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Finishing</label>
                <div class="col-md-10">
                    <div id="finishing_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="finishing_date_selesai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Finish Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglFinSelesaiAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Qty Finish Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyFinSelesaiAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>

            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Finishing Selesai</label>
                <div class="col-md-10">
                    <div id="finishing_selesai_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="fitting_date_mulai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Fitting Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglFitMulaiAktual">
                </div>
            </div>

                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty Fitting Mulai Aktual</label>
                    <div class="col-md-10">
                        <input type="text" 
                               class="form-control" 
                               name="QtyFitMulaiAktual" 
                               pattern="[0-9]*"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               placeholder="Masukkan angka">
                    </div>
                </div>
                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Fitting</label>
                <div class="col-md-10">
                    <div id="fitting_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="fitting_date_selesai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Fitting Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglFitSelesaiAktual">
                </div>
            </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty Fitting Selesai Aktual</label>
                    <div class="col-md-10">
                        <input type="text" 
                               class="form-control" 
                               name="QtyFitSelesaiAktual" 
                               pattern="[0-9]*"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               placeholder="Masukkan angka">
                    </div>
                </div>

                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Fitting Selesai</label>
                <div class="col-md-10">
                    <div id="fitting_selesai_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <!-- Warehouse Actual Section -->
        <div id="warehouse_section_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Warehouse Type</label>
                <div class="col-md-10">
                    <select class="form-control" name="warehouse_type_actual" id="warehouse_type_actual" onchange="showWarehouseActualOptions();">
                        <option value="">(Pilih)</option>
                        <option value="Packing">Packing</option>
                        <option value="Fri">FRI</option>
                        <option value="Stuffing">Stuffing</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Packing Timing Options -->
        <div id="packing_timing_actual" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Timing</label>
                <div class="col-md-10">
                    <select class="form-control" name="packing_timing" id="packing_timing" onchange="showWarehouseDateInput();">
                        <option value="">(Pilih)</option>
                        <option value="mulai">Packing Mulai Actual</option>
                        <option value="selesai">Packing Selesai Actual</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Date Input Sections -->
        <div id="packing_date_mulai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Pack Mulai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglPackMulaiAktual">
                </div>
            </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty Pack Mulai Aktual</label>
                    <div class="col-md-10">
                        <input type="text" 
                               class="form-control" 
                               name="QtyPackMulaiAktual" 
                               pattern="[0-9]*"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               placeholder="Masukkan angka">
                    </div>
                </div>

                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Packing</label>
                <div class="col-md-10">
                    <div id="packing_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="packing_date_selesai" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Pack Selesai Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglPackSelesaiAktual">
                </div>
            </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty Pack Selesai Aktual</label>
                    <div class="col-md-10">
                        <input type="text" 
                               class="form-control" 
                               name="QtyPackSelesaiAktual" 
                               pattern="[0-9]*"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               placeholder="Masukkan angka">
                    </div>
                </div>


                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Packing Selesai</label>
                <div class="col-md-10">
                    <div id="packing_selesai_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="fri_date" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl FRI Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglFriAktual">
                </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Qty FRI Aktual</label>
                <div class="col-md-10">
                    <input type="text" 
                           class="form-control" 
                           name="QtyFriAktual" 
                           pattern="[0-9]*"
                           oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                           placeholder="Masukkan angka">
                </div>
            </div>
                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History FRI</label>
                <div class="col-md-10">
                    <div id="fri_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

        <div id="stuffing_date" style="display:none;">
            <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">Tgl Stuffing Aktual</label>
                <div class="col-md-10">
                    <input type="date" class="form-control" name="TglStuffingAktual">
                </div>
            </div>
                <div class="row" style="margin-top:10px;">
                    <label class="col-md-2 text-uppercase">Qty Stuffing Aktual</label>
                    <div class="col-md-10">
                        <input type="text" 
                               class="form-control" 
                               name="QtyStuffingAktual" 
                               pattern="[0-9]*"
                               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                               placeholder="Masukkan angka">
                    </div>
                </div>
                <div class="row" style="margin-top:10px;">
                <label class="col-md-2 text-uppercase">History Stuffing</label>
                <div class="col-md-10">
                    <div id="stuffing_history" class="well well-sm" style="display:none;"></div>
                </div>
            </div>
        </div>

<!-------------------------------------------------------------------------------------->

            <!---Modal Body---> 
            </div>
            <!---Modal Body--->   
            <!--MODAL-->

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Tambah</button>               
            </div>
        </div>
    </div>
</div>
</form>

<!--KOLOM TABEL-->
<div class="col-md-12" style="margin-top:10px;">
    <div class="table-responsive">
        <table class="table table-bordered" id="tbl_ppic_pi">
            <thead>
                <tr>
                    <th class="text-uppercase text-center vertical-middle col-id" rowspan="4">PI</th>
                    <th class="text-uppercase text-center vertical-middle col-buyer" rowspan="4">PO BUYER</th>
                    <th class="text-uppercase text-center vertical-middle col-date" rowspan="4">PO DATE</th>
                    <th class="text-uppercase text-center vertical-middle col-code" rowspan="4">KODE BUYER</th>            
                    <th class="text-uppercase text-center vertical-middle col-desc" rowspan="4">DESKRIPSI</th>
                    <th class="text-uppercase text-center vertical-middle col-qty" rowspan="4">QTY</th>            
                    <th class="text-uppercase text-center vertical-middle" rowspan="4">CBM</th>
                    <th class="text-uppercase text-center vertical-middle" rowspan="4">TOTAL CBM</th>
                    <th class="text-uppercase text-center vertical-middle" rowspan="4">VALUE</th>
                    <th class="text-uppercase text-center vertical-middle" rowspan="4">TOTAL VALUE</th>
                    <th class="text-uppercase text-center" colspan="8">Sec 1: PURCHASING</th>
                    <th class="text-uppercase text-center" colspan="4">Sec 2: PREPARATION</th>
                    <th class="text-uppercase text-center" colspan="12">Sec 3: PRODUCTION</th>
                    <th class="text-uppercase text-center" colspan="8">Sec 4: WAREHOUSING & SHIPPING</th>
                    <th class="text-uppercase text-center vertical-middle col-date" rowspan="4">LATEST SHIP</th>
                    <th class="text-uppercase text-center vertical-middle col-desc" rowspan="4">ACTUAL SHIP</th>
                    <th class="text-uppercase text-center vertical-middle col-date" rowspan="4">DAY LATE</th>
                    <th class="text-uppercase text-center vertical-middle col-date" rowspan="4">CABANG</th>
                </tr>
                <tr>
                    <th class="text-uppercase text-center" colspan="4">SUPPLIER</th>
                    <th class="text-uppercase text-center" colspan="4">KARTON BOX</th>
                    <th class="text-uppercase text-center" colspan="4">KD/HB/SEMPROT</th>
                    <th class="text-uppercase text-center" colspan="4">PEMBAHANAN</th>
                    <th class="text-uppercase text-center" colspan="4">FINISHING</th>
                    <th class="text-uppercase text-center" colspan="4">FITTING</th>
                    <th class="text-uppercase text-center" colspan="4">PACKING</th>
                    <th class="text-uppercase text-center vertical-middle" colspan="2" rowspan="2">FRI</th>
                    <th class="text-uppercase text-center vertical-middle" colspan="2" rowspan="2">STUFFING</th>
                </tr>
                <tr>
                    <th class="text-uppercase text-center" colspan="2">TURUN PO</th>
                    <th class="text-uppercase text-center" colspan="2">BRG DTG</th>
                    <th class="text-uppercase text-center" colspan="2">TURUN PO</th>
                    <th class="text-uppercase text-center" colspan="2">BRG DTG</th>
                    <th class="text-uppercase text-center" colspan="2">MASUK</th>
                    <th class="text-uppercase text-center" colspan="2">SELESAI</th>
                    <th class="text-uppercase text-center" colspan="2">MASUK</th>
                    <th class="text-uppercase text-center" colspan="2">SELESAI</th>
                    <th class="text-uppercase text-center" colspan="2">MASUK</th>
                    <th class="text-uppercase text-center" colspan="2">SELESAI</th>
                    <th class="text-uppercase text-center" colspan="2">MASUK</th>
                    <th class="text-uppercase text-center" colspan="2">SELESAI</th>
                    <th class="text-uppercase text-center" colspan="2">MASUK</th>
                    <th class="text-uppercase text-center" colspan="2">SELESAI</th>
                </tr>
                <tr>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                    <th class="text-uppercase text-center col-date">PLAN</th>
                    <th class="text-uppercase text-center col-desc">ACTUAL</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>


<script type="text/javascript">

function setpi(){
    $.ajax({
        url:'../ppicpiaktual/getpi',
        dataType:'JSON',
        beforeSend:function(){
            // Store current selection before clearing
            var currentSelection = $('#pilih_pi').val();
            
            $('#pilih_pi').empty().trigger('change');
            $('#pilih_pi').select2({placeholder:'Sedang dimuat'});
        },
        success:function(result){
            var r = result;
            var opt = '<option value="">(Pilih)</option>';
            for(var i=0;i<r.length;i++){
                opt+='<option value="'+r[i].id_dpi+'">'+r[i].NoPI+' | '+r[i].POBuyer+' | '+r[i].KD_ITMBYR+' | '+r[i].DESKRIPTION+'</option>';
            }
            $('#pilih_pi').append(opt);
            $('#pilih_pi').select2({placeholder:'Pilih'});

            // Restore previous selection if exists
            if($('#pilih_pi').find('option[value="'+currentSelection+'"]').length > 0) {
                $('#pilih_pi').val(currentSelection).trigger('change');
            }
        },
        error:function(xhr){
            $('#alert-ppic-pi').html(xhr.responseText);
        }
    });
}

function detailPI() {
    var d = {
        id: $('#pilih_pi').val()
    };

    $.ajax({
        url: '../ppicpiaktual/detailpi',
        type: 'POST',
        data: d,
        dataType: 'JSON',
        success: function (result) {
            if (result && result.length > 0) {
                var r = result[0];


                // Store the ppic_pi ID globally
                window.currentPpicPiId = r.id_ppic_pi;
                
                // Set basic form values
                $('input[name="qty"]').val(r.Qty);
                $('#satuan').html(r.Satuan);
                $('#cabang').val(r.Cabang);
                $('#cabang').trigger('change');
                
                // Handle history loading or message
                if (r.id_ppic_pi) {
                    loadAllHistories(r.id_ppic_pi);
                } else {
                    showNoHistoryMessage();
                }
            }
        },
        error: function (xhr) {
            $.alert(xhr.responseText);
        }
    });
}

function loadAllHistories(id_ppic_pi) {
    const historyTypes = ['kd_hb', 'kd_hb_selesai', 'pembahanan', 'pembahanan_selesai', 'finishing', 'finishing_selesai','fitting','fitting_selesai','packing','packing_selesai','fri','stuffing'];
    historyTypes.forEach(type => {
        loadHistory(id_ppic_pi, type);
    });
}

function showNoHistoryMessage() {
    const containers = [
        'kd_hb_history', 'kd_hb_selesai_history','pembahanan_history', 'pembahanan_selesai_history', 'finishing_history',
        'finishing_selesai_history','fitting_history','fitting_selesai_history','packing_history','packing_selesai_history','fri_history','stuffing_history'];
    containers.forEach(container => {
        $(`#${container}`).html('<div>No history data available</div>').show();
    });
}

function dataTable(){
    $('#tbl_ppic_pi').DataTable({ 
        "processing": true,  
        "order":[], 
        "dom": 'Bfrtip',
        "buttons": [
            //'copy', 'csv', 'excel', 'pdf', 'print'
            {
                extend:'print',
                title:'PPIC pi Planning'
            },
            {
                extend:'copyHtml5',
                exportOptions:{
                    columns: ':visible'
                }
            },
            {
                extend:'excelHtml5',
                exportOptions:{
                    columns: ':visible'
                }
            },
            {
                extend:'pdfHtml5',
                exportOptions:{
                    columns: ':visible'
                }
            }
        ],

        
        "ajax": {
            "url": "../ppicpiaktual/datatablePpicpi",
            "type": "POST"
            //"type": "PUT",
            //"headers": {'<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'}
        },
        "columnDefs":[

            {
                "targets":[4,5,6],
                "className":"text-center"
            }
        ]
    });

    var t=$('#tbl_ppic_pi').DataTable();

    $('#tbl_ppic_pi input').on('input',function(){
        t.search(this.value).draw();
    });
}

function reloadDataTable(){
    $('#tbl_ppic_pi').DataTable().ajax.reload();
}

$(document).ready(function(){
    dataTable();

    var date = new Date();

    setTimeout(function() {
        setInterval(reloadDataTable, 60000);
        reloadDataTable();
    }, (60 - date.getSeconds()) * 1000);



    $('.select2-container').select2({
        width: '100%',
        dropdownAutoWidth: true
    });
});

// Modal close handler
$('#myModal').on('hidden.bs.modal', function () {
    var currentPI = $('#pilih_pi').val();
    $('#form-ppic-pi')[0].reset();
    $('#pilih_pi').val(currentPI);
    $('.section-container').html('').hide(); // Reset container history
    isProcessing = false; // Pastikan flag di-reset
});
// Store PI selection globally
let lastSelectedPI = '';

// Modal show handler
$('#myModal').on('show.bs.modal', function () {
    $('.section-container').hide();
    loadPIOptions();
});

function loadPIOptions() {
    $.ajax({
        url: '../ppicpi/getpi',
        dataType: 'JSON',
        success: function(result) {
            var opt = '<option value="">(Pilih)</option>';
            result.forEach(function(item) {
                opt += `<option value="${item.id_dpi}">${item.NoPI} | ${item.POBuyer} | ${item.KD_ITMBYR} | ${item.DESKRIPTION}</option>`;
            });
            $('#pilih_pi').html(opt);
            
            if (lastSelectedPI) {
                $('#pilih_pi').val(lastSelectedPI);
            }
        }
    });
}

// PI selection change handler
$('#pilih_pi').on('change', function() {
    lastSelectedPI = $(this).val();
});

///==================================================

        // Add this to your existing JavaScript
        $('#type').on('change', function() {

            // Hide all sections first
            hideAllActualSections();
            resetAllSelections();


        });


    function showSubSectionActual() {
        hideAllActualSections();
        var section = $('#section_actual').val();
        
        if (section === 'PREPARATION') {
            $('#preparation_section_actual').show();
        } else if (section === 'PRODUCTION') {
            $('#production_section_actual').show();
        } else if (section === 'WAREHOUSING') {
            $('#warehouse_section_actual').show();
        }
    }


    function showWarehouseActualOptions() {
        var type = $('#warehouse_type_actual').val();
        // First hide all warehouse related elements
        hideAllWarehouseDates();
        
        if (type === 'Packing') {
            $('#packing_timing_actual').show();
        } else if (type === 'Fri') {
            $('#fri_date').show();
        } else if (type === 'Stuffing') {
            $('#stuffing_date').show();
        }
    }

    function showWarehouseDateInput() {
        var timing = $('#packing_timing').val();
        // Hide both date inputs first
        $('#packing_date_mulai, #packing_date_selesai').hide();
        
        if (timing === 'mulai') {
            $('#packing_date_mulai').show();
        } else if (timing === 'selesai') {
            $('#packing_date_selesai').show();
        }
    }


    function showPreparationActualOptions() {
        var type = $('#preparation_type_actual').val();
        if (type === 'KdHbSprt') {
            $('#preparation_timing_actual').show();
        } else {
            $('#preparation_timing_actual').hide();
        }
        $('#preparation_date_mulai, #preparation_date_selesai').hide();
    }

    function showPreparationDateInput() {
        var timing = $('#preparation_timing').val();
        $('#preparation_date_mulai, #preparation_date_selesai').hide();
        
        if (timing === 'mulai') {
            $('#preparation_date_mulai').show();

        } else if (timing === 'selesai') {
            $('#preparation_date_selesai').show();
        }
    }

    function showProductionActualOptions() {
        var type = $('#production_type_actual').val();
        if (type) {
            $('#production_timing_actual').show();
        } else {
            $('#production_timing_actual').hide();
        }
        hideAllProductionDates();
    }

    function showProductionDateInput() {
        hideAllProductionDates();
        var type = $('#production_type_actual').val();
        var timing = $('#production_timing').val();
        
        if (type === 'Pembahanan') {
            if (timing === 'mulai') {
                $('#pembahanan_date_mulai').show();
            } else if (timing === 'selesai') {
                $('#pembahanan_date_selesai').show();
            }
        } else if (type === 'Finishing') {
            if (timing === 'mulai') {
                $('#finishing_date_mulai').show();
            } else if (timing === 'selesai') {
                $('#finishing_date_selesai').show();
            }
        } else if (type === 'Fitting') {
            if (timing === 'mulai') {
                $('#fitting_date_mulai').show();
            } else if (timing === 'selesai') {
                $('#fitting_date_selesai').show();
            }
        }
    }

    function formatDate(dateString) {
        const date = new Date(dateString);
        const day = date.getDate().toString().padStart(2, '0');
        const month = new Intl.DateTimeFormat('en', { month: 'short' }).format(date);
        const year = date.getFullYear().toString().substr(-2);
        return `${day}-${month}-${year}`;
    }

    function hideAllProductionDates() {
        $('#pembahanan_date_mulai, #pembahanan_date_selesai, #finishing_date_mulai, #finishing_date_selesai, #fitting_date_mulai, #fitting_date_selesai').hide();
    }

    function hideAllWarehouseDates() {
        $('#packing_timing_actual, #packing_date_mulai, #packing_date_selesai, #fri_date, #stuffing_date').hide();
    }


    function hideAllSections() {
        $('#purchasing_section, #preparation_section, #production_section, #warehouse_section').hide();
        $('#supplier_dates, #karton_dates, #KdHbSprt_dates, #pembahanan_dates, #finishing_dates, #fitting_dates, #packing_dates, #fri_dates, #stuffing_dates').hide();
    }

    function hideAllActualSections() {
        $('#preparation_section_actual, #preparation_timing_actual, #preparation_date_mulai, #preparation_date_selesai').hide();
        $('#production_section_actual, #production_timing_actual').hide();
        $('#warehouse_section_actual').hide();
        hideAllProductionDates();
        hideAllWarehouseDates();
    }

    $('#packing_timing').on('change', function() {
        showWarehouseDateInput();
    });


    function loadHistory(ppicPiId, type) {
        if (!ppicPiId) return;
        
        const configs = {
            kd_hb: {
                url: 'getKdHbHistory',
                container: 'kd_hb_history',
                prefix: 'MASUK',
                idField: 'id_dppic_kd_hb'
            },
            kd_hb_selesai: {
                url: 'getKdHbSelesaiHistory',
                container: 'kd_hb_selesai_history',
                prefix: 'SELESAI',
                idField: 'id_dppic_kd_hb_selesai'
            },
            pembahanan: {
                url: 'getPembahananHistory',
                container: 'pembahanan_history',
                prefix: 'MASUK',
                idField: 'id_dppic_pembahanan'
            },
            pembahanan_selesai: {
                url: 'getPembahananSelesaiHistory',
                container: 'pembahanan_selesai_history',
                prefix: 'SELESAI',
                idField: 'id_dppic_pembahanan_selesai'
            },
                finishing: {
                url: 'getFinishingHistory',
                container: 'finishing_history',
                prefix: 'MASUK',
                idField: 'id_dppic_finishing'
            },
            finishing_selesai: {
                url: 'getFinishingSelesaiHistory',
                container: 'finishing_selesai_history',
                prefix: 'SELESAI',
                idField: 'id_dppic_finishing_selesai'
            },
            fitting: {
                url: 'getFittingHistory',
                container: 'fitting_history',
                prefix: 'MASUK',
                idField: 'id_dppic_fitting'
            },
            fitting_selesai: {
                url: 'getFittingSelesaiHistory',
                container: 'fitting_selesai_history',
                prefix: 'SELESAI',
                idField: 'id_dppic_fitting_selesai'
            },
            packing: {
                url: 'getPackingHistory',
                container: 'packing_history',
                prefix: 'MASUK',
                idField: 'id_dppic_packing'
            },
            packing_selesai: {
                url: 'getPackingSelesaiHistory',
                container: 'packing_selesai_history',
                prefix: 'SELESAI',
                idField: 'id_dppic_packing_selesai'
            },
            fri: {
                url: 'getFriHistory',
                container: 'fri_history',
                prefix: 'FRI',
                idField: 'id_dppic_fri'
            },
            stuffing: {
                url: 'getStuffingHistory',
                container: 'stuffing_history',
                prefix: 'Stuff',
                idField: 'id_dppic_stuffing'
            }
        };
        
    const config = configs[type];
    
    // Add a loading flag to prevent duplicate requests
    if ($(`#${config.container}`).data('loading')) return;
    
    $(`#${config.container}`).data('loading', true);
    
    $.ajax({
        url: '../ppicpiaktual/' + config.url,
        type: 'POST',
        data: { id_ppic_pi: ppicPiId },
        dataType: 'JSON',
        success: function(result) {
            var historyHtml = '<div class="history-list">';
            if (result && result.length > 0) {
                result.forEach(function(item, index) {
                    const itemId = item[config.idField];
                    historyHtml += `
                        <div class="history-item">
                            <span>
                                <strong>${config.prefix} ${index + 1}:</strong> 
                                ${formatDate(item.tgl_aktual)} 
                                <strong>QTY:</strong> ${item.qty_aktual}
                            </span>
                            <button class="btn btn-danger btn-sm" onclick="deleteHistory('${type}', ${itemId}, ${ppicPiId})">
                                Hapus
                            </button>
                        </div>
                    `;
                });
            }
            historyHtml += '</div>';
            $(`#${config.container}`).html(historyHtml).show();
        },
        complete: function() {
            $(`#${config.container}`).data('loading', false);
        }
    });
}

// function deleteHistory(type, id, ppicPiId) {
//     if (!ppicPiId) {
//         ppicPiId = window.currentPpicPiId;
//     }
    
//     if (confirm('Are you sure you want to delete this record?')) {
//         $.ajax({
//             url: '../ppicpiaktual/deleteHistory',
//             type: 'POST',
//             data: { 
//                 id: id,
//                 type: type,
//                 ppic_pi_id: ppicPiId
//             },
//             dataType: 'JSON',
//             success: function(response) {
//                 if (response.status === 'success') {
//                     // Only reload the specific history that was affected
//                     loadHistory(ppicPiId, type);
                    
//                     // Delay the datatable reload slightly
//                     setTimeout(function() {
//                         reloadDataTable();
//                     }, 100);
//                 }
//             }
//         });
//     }
// }

let isProcessing = false; // Flag untuk memproses request
function deleteHistory(type, id, ppicPiId) {
    if (isProcessing) return; // Jika sedang memproses, hentikan
    isProcessing = true;

    if (!ppicPiId) {
        ppicPiId = window.currentPpicPiId;
    }

    if (confirm('Are you sure you want to delete this record?')) {
        $.ajax({
            url: '../ppicpiaktual/deleteHistory',
            type: 'POST',
            data: { 
                id: id,
                type: type,
                ppic_pi_id: ppicPiId
            },
            dataType: 'JSON',
            success: function(response) {
                if (response.status === 'success') {
                    loadHistory(ppicPiId, type);
                }
            },
            complete: function() {
                isProcessing = false; // Reset flag setelah request selesai
            }
        });
    } else {
        isProcessing = false; // Reset flag jika user membatalkan konfirmasi
    }
}





///==================================================

// $('#form-ppic-pi').submit(function(e){
//     e.preventDefault();
//     var selectedPI = $('#pilih_pi').val(); // Store current PI selection
    
//     $.ajax({
//         url:'../ppicpiaktual/saveData',
//         type:'POST',
//         data:$('#form-ppic-pi').serialize(),
//         beforeSend:function(){
//             $('#alert-form-ppicpi').html('<div class="alert alert-warning">Menyimpan data</div>');
//         },
//         success:function(data){
//             $('#alert-form-ppicpi').html(data);
//             reloadDataTable();
            
//             // Keep the PI selection and only clear other fields
//             $('#pilih_pi').val(selectedPI).trigger('change');
//             // Force reload details after short delay to ensure data is updated
//             setTimeout(function() {
//                 detailPI();
//             }, 500);
            
//             // Clear only specific fields
//             $('input[name="qty"]').val('');
//             $('#satuan').html('');
            
            
//         },
//         error:function(xhr){
//             $('#alert-form-ppicpi').html('<div class="alert alert-danger">'+xhr.responseText+'</div>');
//         }
//     });
// });
$('#form-ppic-pi').submit(function(e) {
    e.preventDefault();
    var selectedPI = $('#pilih_pi').val();
    
    $.ajax({
        url: '../ppicpiaktual/saveData',
        type: 'POST',
        data: $('#form-ppic-pi').serialize(),
        beforeSend: function() {
            $('#alert-form-ppicpi').html('<div class="alert alert-warning">Menyimpan data</div>');
        },
        success: function(data) {
            $('#alert-form-ppicpi').html(data);
            
            // Clear specific form fields
            $('input[name="qty"]').val('');
            $('#satuan').html('');
            
            // Reload only necessary data
            detailPI();
        },
        error: function(xhr) {
            $('#alert-form-ppicpi').html('<div class="alert alert-danger">' + xhr.responseText + '</div>');
        }
    });
});


</script>
