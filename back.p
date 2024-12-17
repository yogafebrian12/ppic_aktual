<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PpicPIAktual extends CI_Controller {

	// public function getPI(){
	// 	$sql_pi = '
	// 		SELECT *
	// 		FROM pigdgnew a
	// 		JOIN d_pigdgnew b ON a.id_pi=b.id_pi
	// 		JOIN brgpi c ON b.id_Brg=c.id_Brg
	// 		WHERE b.QtyPL > 0
	// 		ORDER BY a.TglPI DESC
	// 	';
	// 	$q_pi = $this->crud->getDataQuery($sql_pi)->result();
	// 	echo json_encode($q_pi);
	// }

    public function getPI(){
        $sql_pi = '
            SELECT *
            FROM pigdgnew a
            JOIN d_pigdgnew b ON a.id_pi=b.id_pi
            JOIN brgpi c ON b.id_Brg=c.id_Brg
            WHERE b.QtyPL > 0
            AND b.sts_ppic = 1
            ORDER BY a.TglPI DESC
        ';
        $q_pi = $this->crud->getDataQuery($sql_pi)->result();
        echo json_encode($q_pi);
    }

    public function detailPI(){
        $id = $this->input->post('id');
        $sql_pi = '
            SELECT a.*, b.*, c.*, p.Cabang, p.id_ppic_pi
            FROM pigdgnew a
            JOIN d_pigdgnew b ON a.id_pi=b.id_pi
            JOIN brgpi c ON b.id_Brg=c.id_Brg
            LEFT JOIN ppic_pi p ON b.id_dpi=p.id_dpi
            WHERE b.id_dpi="'.$id.'"
        ';
        $q_pi = $this->crud->getDataQuery($sql_pi)->result();
        echo json_encode($q_pi);
    }

    //=======================================================
    public function getKdHbHistory() {
        $sql = "SELECT id_dppic_kd_hb, tgl_aktual, qty_aktual 
                FROM d_ppic_kd_hb 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
                
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getKdHbSelesaiHistory() {
        $sql = "SELECT id_dppic_kd_hb_selesai, tgl_aktual, qty_aktual 
                FROM d_ppic_kd_hb_selesai 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."'
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getPembahananHistory() {
        $sql = "SELECT id_dppic_pembahanan, tgl_aktual, qty_aktual 
                FROM d_ppic_pembahanan
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);    
    }

    public function getPembahananSelesaiHistory() {
        $sql = "SELECT id_dppic_pembahanan_selesai, tgl_aktual, qty_aktual 
                FROM d_ppic_pembahanan_selesai 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getFinishingHistory() {
        $sql = "SELECT id_dppic_finishing, tgl_aktual, qty_aktual 
                FROM d_ppic_finishing 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getFinishingSelesaiHistory() {
        $sql = "SELECT id_dppic_finishing_selesai, tgl_aktual, qty_aktual 
                FROM d_ppic_finishing_selesai 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getFittingHistory() {
        $sql = "SELECT id_dppic_fitting, tgl_aktual, qty_aktual 
                FROM d_ppic_fitting 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getFittingSelesaiHistory() {
        $sql = "SELECT id_dppic_fitting_selesai, tgl_aktual, qty_aktual 
                FROM d_ppic_fitting_selesai 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getPackingHistory() {
        $sql = "SELECT id_dppic_packing, tgl_aktual, qty_aktual 
                FROM d_ppic_packing 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getPackingSelesaiHistory() {
        $sql = "SELECT id_dppic_packing_selesai, tgl_aktual, qty_aktual 
                FROM d_ppic_packing_selesai 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getFriHistory() {
        $sql = "SELECT id_dppic_fri, tgl_aktual, qty_aktual 
                FROM d_ppic_fri 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }

    public function getStuffingHistory() {
        $sql = "SELECT id_dppic_stuffing, tgl_aktual, qty_aktual 
                FROM d_ppic_stuffing 
                WHERE id_ppic_pi = '".$this->input->post('id_ppic_pi')."' 
                ORDER BY tgl_aktual ASC";
        $history = $this->crud->getDataQuery($sql)->result();
        echo json_encode($history);
    }


//     public function deleteHistory() {
//         $id = $this->input->post('id');
//         $type = $this->input->post('type');
//             $ppic_pi_id = $this->input->post('ppic_pi_id');
        
//         $tables = [
//             'kd_hb' => ['table' => 'd_ppic_kd_hb', 'id' => 'id_dppic_kd_hb'],
//             'kd_hb_selesai' => ['table' => 'd_ppic_kd_hb_selesai', 'id' => 'id_dppic_kd_hb_selesai'],
//             'pembahanan' => ['table' => 'd_ppic_pembahanan', 'id' => 'id_dppic_pembahanan'],
//             'pembahanan_selesai' => ['table' => 'd_ppic_pembahanan_selesai', 'id' => 'id_dppic_pembahanan_selesai'],
//             'finishing' => ['table' => 'd_ppic_finishing', 'id' => 'id_dppic_finishing'],
//             'finishing_selesai' => ['table' => 'd_ppic_finishing_selesai', 'id' => 'id_dppic_finishing_selesai'],
//             'fitting' => ['table' => 'd_ppic_fitting', 'id' => 'id_dppic_fitting'],
//             'fitting_selesai' => ['table' => 'd_ppic_fitting_selesai', 'id' => 'id_dppic_fitting_selesai'],
//             'packing' => ['table' => 'd_ppic_packing', 'id' => 'id_dppic_packing'],
//             'packing_selesai' => ['table' => 'd_ppic_packing_selesai', 'id' => 'id_dppic_packing_selesai']
//         ];
        
//     $config = $tables[$type];
    
//     // Use transaction to ensure data consistency
//     $this->db->trans_start();
    
//     $sql = "DELETE FROM {$config['table']} WHERE {$config['id']} = ? AND id_ppic_pi = ?";
//     $this->db->query($sql, array($id, $ppic_pi_id));
    
//     $this->db->trans_complete();
    
//     echo json_encode([
//         'status' => ($this->db->trans_status() && $this->db->affected_rows() > 0) ? 'success' : 'error'
//     ]);
// }

    public function deleteHistory() {
        $id = $this->input->post('id');
        $type = $this->input->post('type');
        $ppic_pi_id = $this->input->post('ppic_pi_id');
        
        $tables = [
            'kd_hb' => ['table' => 'd_ppic_kd_hb', 'id' => 'id_dppic_kd_hb'],
            'kd_hb_selesai' => ['table' => 'd_ppic_kd_hb_selesai', 'id' => 'id_dppic_kd_hb_selesai'],
            'pembahanan' => ['table' => 'd_ppic_pembahanan', 'id' => 'id_dppic_pembahanan'],
            'pembahanan_selesai' => ['table' => 'd_ppic_pembahanan_selesai', 'id' => 'id_dppic_pembahanan_selesai'],
            'finishing' => ['table' => 'd_ppic_finishing', 'id' => 'id_dppic_finishing'],
            'finishing_selesai' => ['table' => 'd_ppic_finishing_selesai', 'id' => 'id_dppic_finishing_selesai'],
            'fitting' => ['table' => 'd_ppic_fitting', 'id' => 'id_dppic_fitting'],
            'fitting_selesai' => ['table' => 'd_ppic_fitting_selesai', 'id' => 'id_dppic_fitting_selesai'],
            'packing' => ['table' => 'd_ppic_packing', 'id' => 'id_dppic_packing'],
            'packing_selesai' => ['table' => 'd_ppic_packing_selesai', 'id' => 'id_dppic_packing_selesai'],
            'fri' => ['table' => 'd_ppic_fri', 'id' => 'id_dppic_fri'],
            'stuffing' => ['table' => 'd_ppic_stuffing', 'id' => 'id_dppic_stuffing']
        ];
        
        $config = $tables[$type];
        
        $this->db->trans_start();
        
        // Add specific WHERE clause for ppic_pi_id
        $this->db->where($config['id'], $id);
        $this->db->where('id_ppic_pi', $ppic_pi_id);
        $this->db->delete($config['table']);
        
        $this->db->trans_complete();
        
        echo json_encode([
            'status' => ($this->db->trans_status()) ? 'success' : 'error'
        ]);
    }

    //=======================================================


public function saveData() {
    $input = $this->input;
    $d_pi = $this->crud->getDataWhere('d_pigdgnew', array('id_dpi' => $input->post('d_pi')))->row_array();

    // Get the existing PPIC PI record or create new one
    $existing_record = $this->crud->getDataWhere('ppic_pi', array(
        'id_dpi' => $d_pi['id_dpi'],
        'id_pi' => $d_pi['id_pi']
    ))->row_array();

    if (!$existing_record) {
        // Create base PPIC PI record if it doesn't exist
        $ppic_pi_data = array(
            'id_dpi' => $d_pi['id_dpi'],
            'id_pi' => $d_pi['id_pi'],
            'QtyPO' => $input->post('qty'),
            'Cabang' => $input->post('cabang')
        );
        $respon = $this->crud->insertDataSave('ppic_pi', $ppic_pi_data);
        if ($respon['code'] != 0) {
            echo '<div class="alert alert-warning">' . $respon['message'] . '</div>';
            return;
        }
        $id_ppic_pi = $this->db->insert_id();
    } else {
        $id_ppic_pi = $existing_record['id_ppic_pi'];
    }

//========================================================================================
    // Handle KD/HB/Semprot Mulai Actual
    if ($input->post('TglKdHbSprtMulaiAktual')) {
        $existing_kd_hb = $this->crud->getDataWhere('d_ppic_kd_hb', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglKdHbSprtMulaiAktual'),
            'qty_aktual' => $input->post('QtyKdHbSprtMulaiAktual')
        ))->row_array();
    if (!$existing_kd_hb) {
            $kd_hb_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglKdHbSprtMulaiAktual'),
                'qty_aktual' => $input->post('QtyKdHbSprtMulaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_kd_hb', $kd_hb_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB Start: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }

    // Handle KD/HB/Semprot Selesai Actual
    if ($input->post('TglKdHbSprtSelesaiAktual')) {
        $existing_kd_hb_selesai = $this->crud->getDataWhere('d_ppic_kd_hb_selesai', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglKdHbSprtSelesaiAktual'),
            'qty_aktual' => $input->post('QtyKdHbSprtSelesaiAktual')
        ))->row_array();

        if (!$existing_kd_hb_selesai) {
            $kd_hb_selesai_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglKdHbSprtSelesaiAktual'),
                'qty_aktual' => $input->post('QtyKdHbSprtSelesaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_kd_hb_selesai', $kd_hb_selesai_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }

    if ($input->post('TglPembMulaiAktual')) {
        $existing_pembahanan = $this->crud->getDataWhere('d_ppic_pembahanan', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglPembMulaiAktual'),
            'qty_aktual' => $input->post('QtyPembMulaiAktual')
        ))->row_array();

        if (!$existing_pembahanan) {
            $pembahanan_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglPembMulaiAktual'),
                'qty_aktual' => $input->post('QtyPembMulaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_pembahanan', $pembahanan_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }

    if ($input->post('TglPembSelesaiAktual')) {
        $existing_pembahanan_selesai = $this->crud->getDataWhere('d_ppic_pembahanan_selesai', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglPembSelesaiAktual'),
            'qty_aktual' => $input->post('QtyPembSelesaiAktual')
        ))->row_array();

        if (!$existing_pembahanan_selesai) {
            $pembahanan_selesai_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglPembSelesaiAktual'),
                'qty_aktual' => $input->post('QtyPembSelesaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_pembahanan_selesai', $pembahanan_selesai_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }

     if ($input->post('TglFinMulaiAktual')) {
        $existing_finishing = $this->crud->getDataWhere('d_ppic_finishing', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglFinMulaiAktual'),
            'qty_aktual' => $input->post('QtyFinMulaiAktual')
        ))->row_array();

        if (!$existing_finishing) {
            $finishing_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglFinMulaiAktual'),
                'qty_aktual' => $input->post('QtyFinMulaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_finishing', $finishing_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }


     if ($input->post('TglFinSelesaiAktual')) {
        $existing_finishing_selesai = $this->crud->getDataWhere('d_ppic_finishing_selesai', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglFinSelesaiAktual'),
            'qty_aktual' => $input->post('QtyFinSelesaiAktual')
        ))->row_array();

        if (!$existing_finishing_selesai) {
            $finishing_selesai_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglFinSelesaiAktual'),
                'qty_aktual' => $input->post('QtyFinSelesaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_finishing_selesai', $finishing_selesai_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }     



     if ($input->post('TglFitMulaiAktual')) {
        $existing_fitting = $this->crud->getDataWhere('d_ppic_fitting', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglFitMulaiAktual'),
            'qty_aktual' => $input->post('QtyFitMulaiAktual')
        ))->row_array();

        if (!$existing_fitting) {
            $fitting_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglFitMulaiAktual'),
                'qty_aktual' => $input->post('QtyFitMulaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_fitting', $fitting_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }     


     if ($input->post('TglFitSelesaiAktual')) {
        $existing_fitting_selesai = $this->crud->getDataWhere('d_ppic_fitting_selesai', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglFitSelesaiAktual'),
            'qty_aktual' => $input->post('QtyFitSelesaiAktual')
        ))->row_array();

        if (!$existing_fitting_selesai) {
            $fitting_selesai_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglFitSelesaiAktual'),
                'qty_aktual' => $input->post('QtyFitSelesaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_fitting_selesai', $fitting_selesai_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }  


     if ($input->post('TglPackMulaiAktual')) {
        $existing_packing = $this->crud->getDataWhere('d_ppic_packing', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglPackMulaiAktual'),
            'qty_aktual' => $input->post('QtyPackMulaiAktual')
        ))->row_array();

        if (!$existing_packing) {
            $packing_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglPackMulaiAktual'),
                'qty_aktual' => $input->post('QtyPackMulaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_packing', $packing_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }    

     if ($input->post('TglPackSelesaiAktual')) {
        $existing_packing_selesai = $this->crud->getDataWhere('d_ppic_packing_selesai', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglPackSelesaiAktual'),
            'qty_aktual' => $input->post('QtyPackSelesaiAktual')
        ))->row_array();

        if (!$existing_packing_selesai) {
            $packing_selesai_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglPackSelesaiAktual'),
                'qty_aktual' => $input->post('QtyPackSelesaiAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_packing_selesai', $packing_selesai_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }  

     if ($input->post('TglFriAktual')) {
        $existing_fri = $this->crud->getDataWhere('d_ppic_fri', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglFriAktual'),
            'qty_aktual' => $input->post('QtyFriAktual')
        ))->row_array();

        if (!$existing_fri) {
            $fri_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglFriAktual'),
                'qty_aktual' => $input->post('QtyFriAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_fri', $fri_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }    

     if ($input->post('TglStuffingAktual')) {
        $existing_stuffing = $this->crud->getDataWhere('d_ppic_stuffing', array(
            'id_ppic_pi' => $id_ppic_pi,
            'tgl_aktual' => $input->post('TglStuffingAktual'),
            'qty_aktual' => $input->post('QtyStuffingAktual')
        ))->row_array();

        if (!$existing_stuffing) {
            $stuffing_data = array(
                'id_ppic_pi' => $id_ppic_pi,
                'tgl_aktual' => $input->post('TglStuffingAktual'),
                'qty_aktual' => $input->post('QtyStuffingAktual')
            );
            $respon = $this->crud->insertDataSave('d_ppic_stuffing', $stuffing_data);
            if ($respon['code'] != 0) {
                echo '<div class="alert alert-warning">Error saving KD/HB End: ' . $respon['message'] . '</div>';
                return;
            }
        }
    }    
//==============================================================================================

    // Update PI status
    $w_dpi = array(
        'id_pi' => $d_pi['id_pi'],
        'id_dpi' => $d_pi['id_dpi']
    );
    $d_dpi = array('sts_ppic' => 1);
    $this->crud->updData('d_pigdgnew', $w_dpi, $d_dpi);

    echo '<div class="alert alert-success">Data berhasil disimpan</div>';
}



public function datatablePpicPI() {
    $draw = intval($this->input->get("draw"));
    $start = intval($this->input->get("start"));
    $length = intval($this->input->get("length"));

    $sql = "
	        SELECT 
	            p.*,
	            pi.NoPI, 
	            pi.POBuyer, 
	            pi.TglPI,
	            pi.TglShip,
	            d.kode_byr, 
	            d.Qty,
	            d.Press,
	            d.SubTotal,
	            b.DESKRIPTION,
	            b.DESKRIPTION2,
	            b.KD_ITMBYR,
	            b.KD_ITEMVDR,
	            b.KD_ITEMDESIN,
	            b.Satuan,
	            b.CBM,
	            p.TglPoSup,
	            p.TglBrgDtg,
	            p.TglPoCtnSup,
	            p.TglBrgCtnDtg,
	            p.TglKdHbSprtMulai,
	            p.TglKdHbSprtSelesai,
	            p.TglPembMulai,
	            p.TglPembSelesai,
	            p.TglFinMulai,
	            p.TglFinSelesai,
	            p.TglFitMulai,
	            p.TglFitSelesai,
	            p.TglPackMulai,
	            p.TglPackSelesai,
	            p.TglFri,
	            P.TglStuffing,
	            p.section,
	            p.Cabang,
                #p.TglKdHbSprtMulaiAktual,
                p.TglKdHbSprtSelesaiAktual, 
                #p.TglPembMulaiAktual,
                p.TglPembSelesaiAktual,
                #p.TglFinMulaiAktual,
                p.TglFinSelesaiAktual,
                #p.TglFitMulaiAktual, 
                p.TglFitSelesaiAktual, 
                #p.TglPackMulaiAktual,
                p.TglPackSelesaiAktual,
                p.TglStuffingAktual,
                p.TglFriAktual
	        FROM ppic_pi p
	        JOIN d_pigdgnew d ON p.id_dpi = d.id_dpi
	        JOIN pigdgnew PI ON d.id_pi = pi.id_pi
	        JOIN brgpi b ON d.id_Brg = b.id_Brg
	        ORDER BY p.id_ppic_pi ASC
	    ";

    $query = $this->crud->getDataQuery($sql);
    $data = [];

    foreach ($query->result() as $row) {

        // Mendapatkan data PO Actual untuk Supplier (K001, K003)
        $supplier_po_sql = "
            SELECT DISTINCT po.NoPO, po.TglPO, dpo.QTY, po.JBSuppler
            FROM pobwnew po 
            JOIN d_pobwnew dpo ON po.id_po = dpo.id_po
            JOIN brgpo brg ON dpo.id_Brgpo = brg.id_Brgpo
            JOIN d_pigdgnew dpg ON dpg.id_pi = po.id_pi
            JOIN brgpi bp ON dpg.id_Brg = bp.id_Brg
            WHERE po.id_pi = '{$row->id_pi}' 
            AND brg.kategori_kode IN ('K001', 'K003')
            AND dpg.id_dpi = '{$row->id_dpi}'
            AND brg.id_Brg = bp.id_Brg
            ORDER BY po.TglPO
        ";
        $supplier_pos = $this->crud->getDataQuery($supplier_po_sql)->result();

        // Mendapatkan data PO Actual untuk Karton (K002)
        $karton_po_sql = "
            SELECT DISTINCT po.NoPO, po.TglPO, dpo.QTY, po.JBSuppler
            FROM pobwnew po 
            JOIN d_pobwnew dpo ON po.id_po = dpo.id_po
            JOIN brgpo brg ON dpo.id_Brgpo = brg.id_Brgpo
            JOIN d_pigdgnew dpg ON dpg.id_pi = po.id_pi
            JOIN brgpi bp ON dpg.id_Brg = bp.id_Brg
            WHERE po.id_pi = '{$row->id_pi}' 
            AND brg.kategori_kode = 'K002'
            AND dpg.id_dpi = '{$row->id_dpi}'
            AND brg.id_Brg = bp.id_Brg
            ORDER BY po.TglPO
        ";
        $karton_pos = $this->crud->getDataQuery($karton_po_sql)->result();

        // lpb ITEMPO
        $supplier_po_lpb_sql = "
            SELECT DISTINCT l.NoLPB, l.tgl_terima, dl.Qty, l.terimadari
            FROM lpb l 
            JOIN d_lpb dl ON l.id_lpb = dl.id_lpb
            JOIN pobwnew po ON l.id_po = po.id_po
            JOIN d_pobwnew dpo ON po.id_po = dpo.id_po
            JOIN brgpo brg ON dpo.id_Brgpo = brg.id_Brgpo
            JOIN d_pigdgnew dpg ON dpg.id_pi = po.id_pi
            JOIN brgpi bp ON dpg.id_Brg = bp.id_Brg
            WHERE po.id_pi = '{$row->id_pi}' 
            AND brg.kategori_kode IN ('K001', 'K003')
            AND dpg.id_dpi = '{$row->id_dpi}'
            AND brg.id_Brg = bp.id_Brg
            ORDER BY l.tgl_terima
        ";
        $supplier_lpb_pos = $this->crud->getDataQuery($supplier_po_lpb_sql)->result();


        // lpb KARTON
        $karton_po_lpb_sql = "
            SELECT DISTINCT l.NoLPB, l.tgl_terima, dl.Qty, l.terimadari
            FROM lpb l 
            JOIN d_lpb dl ON l.id_lpb = dl.id_lpb
            JOIN pobwnew po ON l.id_po = po.id_po
            JOIN d_pobwnew dpo ON po.id_po = dpo.id_po
            JOIN brgpo brg ON dpo.id_Brgpo = brg.id_Brgpo
            JOIN d_pigdgnew dpg ON dpg.id_pi = po.id_pi
            JOIN brgpi bp ON dpg.id_Brg = bp.id_Brg
            WHERE po.id_pi = '{$row->id_pi}' 
            AND brg.kategori_kode IN ('K002')
            AND dpg.id_dpi = '{$row->id_dpi}'
            AND brg.id_Brg = bp.id_Brg
            ORDER BY l.tgl_terima
        ";
        $karton_lpb_pos = $this->crud->getDataQuery($karton_po_lpb_sql)->result();

        $shipment_sql = "
        SELECT DISTINCT 
            plc.no_PL, 
            plc.tgl, 
            dpl.qty
        FROM d_plciinvoice dpl
        JOIN plciinvoice plc ON dpl.id_PLCIINVOICE = plc.id_PLCIINVOICE
        JOIN ppic_pi ppi ON dpl.id_pi = ppi.id_pi
        JOIN d_pigdgnew dpg ON ppi.id_dpi = dpg.id_dpi
        WHERE ppi.id_pi = '{$row->id_pi}'
        AND ppi.id_dpi = '{$row->id_dpi}'
        AND dpl.id_Brg = dpg.id_Brg
        ORDER BY plc.tgl
        ";
        $shipment_pos = $this->crud->getDataQuery($shipment_sql)->result();

        $kd_sql = "
            SELECT 
                kd.tgl_aktual, 
                kd.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_kd_hb kd ON pic.id_ppic_pi = kd.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY kd.tgl_aktual
        ";
        $kd_pos = $this->crud->getDataQuery($kd_sql)->result();


        $kd_selesai_sql = "
            SELECT 
                kd.tgl_aktual, 
                kd.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_kd_hb_selesai kd ON pic.id_ppic_pi = kd.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY kd.tgl_aktual
        ";
        $kd_selesai_pos = $this->crud->getDataQuery($kd_selesai_sql)->result();


        $pembahanan_sql = "
            SELECT 
                pemb.tgl_aktual, 
                pemb.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_pembahanan pemb ON pic.id_ppic_pi = pemb.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY pemb.tgl_aktual
        ";
        $pembahanan_pos = $this->crud->getDataQuery($pembahanan_sql)->result();

        $pembahanan_selesai_sql = "
            SELECT 
                pemb.tgl_aktual, 
                pemb.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_pembahanan_selesai pemb ON pic.id_ppic_pi = pemb.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY pemb.tgl_aktual
        ";
        $pembahanan_selesai_pos = $this->crud->getDataQuery($pembahanan_selesai_sql)->result();


        $finishing_sql = "
            SELECT 
                fin.tgl_aktual, 
                fin.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_finishing fin ON pic.id_ppic_pi = fin.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY fin.tgl_aktual
        ";
        $finishing_pos = $this->crud->getDataQuery($finishing_sql)->result();

        $finishing_selesai_sql = "
            SELECT 
                fin.tgl_aktual, 
                fin.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_finishing_selesai fin ON pic.id_ppic_pi = fin.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY fin.tgl_aktual
        ";
        $finishing_selesai_pos = $this->crud->getDataQuery($finishing_selesai_sql)->result();


        $fitting_sql = "
            SELECT 
                fit.tgl_aktual, 
                fit.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_fitting fit ON pic.id_ppic_pi = fit.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY fit.tgl_aktual
        ";
        $fitting_pos = $this->crud->getDataQuery($fitting_sql)->result();

        $fitting_selesai_sql = "
            SELECT 
                fit.tgl_aktual, 
                fit.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_fitting_selesai fit ON pic.id_ppic_pi = fit.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY fit.tgl_aktual
        ";
        $fitting_selesai_pos = $this->crud->getDataQuery($fitting_selesai_sql)->result();


        $packing_sql = "
            SELECT 
                pack.tgl_aktual, 
                pack.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_packing pack ON pic.id_ppic_pi = pack.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY pack.tgl_aktual
        ";
        $packing_pos = $this->crud->getDataQuery($packing_sql)->result();

        $packing_selesai_sql = "
            SELECT 
                pack.tgl_aktual, 
                pack.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_packing_selesai pack ON pic.id_ppic_pi = pack.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY pack.tgl_aktual
        ";
        $packing_selesai_pos = $this->crud->getDataQuery($packing_selesai_sql)->result();

        $fri_sql = "
            SELECT 
                fri.tgl_aktual, 
                fri.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_fri fri ON pic.id_ppic_pi = fri.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY fri.tgl_aktual
        ";
        $fri_pos = $this->crud->getDataQuery($fri_sql)->result();

        $stuffing_sql = "
            SELECT 
                stuff.tgl_aktual, 
                stuff.qty_aktual
            FROM ppic_pi pic
            JOIN d_ppic_stuffing stuff ON pic.id_ppic_pi = stuff.id_ppic_pi
            WHERE pic.id_ppic_pi = '{$row->id_ppic_pi}'
            ORDER BY stuff.tgl_aktual
        ";
        $stuffing_pos = $this->crud->getDataQuery($stuffing_sql)->result();
 //=================================================================================================

        // Menggabungkan hasil PO Supplier
        $supplier_po_details = '';
        foreach ($supplier_pos as $i => $po) {
            $supplier_po_details .= 'PO'.($i+1).': '.$po->NoPO.' ('.date('d-M-y', strtotime($po->TglPO)).') QTY: '.$po->QTY.' SUPPLIER: '.$po->JBSuppler.'<br>';
        }

        // Menggabungkan hasil PO Karton
        $karton_po_details = '';
        foreach ($karton_pos as $i => $po) {
            $karton_po_details .= 'PO'.($i+1).': '.$po->NoPO.' ('.date('d-M-y', strtotime($po->TglPO)).') QTY: '.$po->QTY.' SUPPLIER: '.$po->JBSuppler.' <br>';
        }

        $supplier_po_lpb_details = '';
        foreach ($supplier_lpb_pos as $i => $po) {
            $supplier_po_lpb_details .= 'LPB'.($i+1).': '.$po->NoLPB.' ('.date('d-M-y', strtotime($po->tgl_terima)).') QTY: '.$po->Qty.' SUPPLIER: '.$po->terimadari.'<br>';
        }

        $karton_po_lpb_details = '';
        foreach ($karton_lpb_pos as $i => $po) {
            $karton_po_lpb_details .= 'LPB'.($i+1).': '.$po->NoLPB.' ('.date('d-M-y', strtotime($po->tgl_terima)).') QTY: '.$po->Qty.' SUPPLIER: '.$po->terimadari.'<br>';
        }

        $shipment_details = '';
        foreach ($shipment_pos as $i => $pl) {
            // Menampilkan no_PL, tgl, dan qty
            $shipment_details .= 'IPL' . ($i + 1) . ': ' . $pl->no_PL . 
                                 ' (' . date('d-M-y', strtotime($pl->tgl)) . ') ' . 
                                 'QTY: ' . $pl->qty . '<br>';
        }

        $kd_details = '';
        foreach ($kd_pos as $i => $kd) {
            $kd_details .= '<strong>MASUK</strong> ' . ($i + 1) . ': ' . date('d-M-y', strtotime($kd->tgl_aktual)) . '<strong> QTY: </strong> ' . $kd->qty_aktual . '<br>';
        }

        $kd_selesai_details = '';
        foreach ($kd_selesai_pos as $i => $kd_selesai) {
            $kd_selesai_details .= 'SELESAI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($kd_selesai->tgl_aktual)) . ' QTY: ' . $kd_selesai->qty_aktual . '<br>';
        }


        $pembahanan_details = '';
        foreach ($pembahanan_pos as $i => $pemb) {
            $pembahanan_details .= 'MASUK ' . ($i + 1) . ': ' . date('d-M-y', strtotime($pemb->tgl_aktual)) . ' QTY: ' . $pemb->qty_aktual . '<br>';
        }

        $pembahanan_selesai_details = '';
        foreach ($pembahanan_selesai_pos as $i => $pemb) {
            $pembahanan_selesai_details .= 'SELESAI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($pemb->tgl_aktual)) . ' QTY: ' . $pemb->qty_aktual . '<br>';
        }

        $finishing_details = '';
        foreach ($finishing_pos as $i => $fin) {
            $finishing_details .= 'MASUK ' . ($i + 1) . ': ' . date('d-M-y', strtotime($fin->tgl_aktual)) . ' QTY: ' . $fin->qty_aktual . '<br>';
        }

        $finishing_selesai_details = '';
        foreach ($finishing_selesai_pos as $i => $fin) {
            $finishing_selesai_details .= 'SELESAI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($fin->tgl_aktual)) . ' QTY: ' . $fin->qty_aktual . '<br>';
        }


        $fitting_details = '';
        foreach ($fitting_pos as $i => $fit) {
            $fitting_details .= 'MASUK ' . ($i + 1) . ': ' . date('d-M-y', strtotime($fit->tgl_aktual)) . ' QTY: ' . $fit->qty_aktual . '<br>';
        }

        $fitting_selesai_details = '';
        foreach ($fitting_selesai_pos as $i => $fit) {
            $fitting_selesai_details .= 'SELESAI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($fit->tgl_aktual)) . ' QTY: ' . $fit->qty_aktual . '<br>';
        }

        $packing_details = '';
        foreach ($packing_pos as $i => $pack) {
            $packing_details .= 'MASUK ' . ($i + 1) . ': ' . date('d-M-y', strtotime($pack->tgl_aktual)) . ' QTY: ' . $pack->qty_aktual . '<br>';
        }

        $packing_selesai_details = '';
        foreach ($packing_selesai_pos as $i => $pack) {
            $packing_selesai_details .= 'SELESAI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($pack->tgl_aktual)) . ' QTY: ' . $pack->qty_aktual . '<br>';
        }

        $fri_details = '';
        foreach ($fri_pos as $i => $fri) {
            $fri_details .= 'FRI ' . ($i + 1) . ': ' . date('d-M-y', strtotime($fri->tgl_aktual)) . ' QTY: ' . $fri->qty_aktual . '<br>';
        }

        $stuffing_details = '';
        foreach ($stuffing_pos as $i => $stuff) {
            $stuffing_details .= 'STUFF ' . ($i + 1) . ': ' . date('d-M-y', strtotime($stuff->tgl_aktual)) . ' QTY: ' . $stuff->qty_aktual . '<br>';
        }
//====================================================================

        // Menggabungkan deskripsi item
        $item = $row->DESKRIPTION . '<br>';
        if ($row->DESKRIPTION2) {
            $item .= '<small>' . $row->DESKRIPTION2 . '</small><br>';
        }
        $item .= '<b>' . $row->KD_ITMBYR . ' / ' . $row->KD_ITEMVDR . ' / ' . $row->KD_ITEMDESIN . '</b>';

        // Menghitung selisih hari untuk keterlambatan
        $shipDate = new DateTime($row->TglShip);
        $today = new DateTime();
        $interval = $today->diff($shipDate);
        $daysLateDisplay = ($shipDate > $today) 
            ? '<span style="color: green;">+' . $interval->days . ' days</span>'
            : '<span style="color: red;">-' . $interval->days . ' days</span>';

        // Menyusun data untuk datatable

	        $data[] = array(
	            $row->NoPI,
	            $row->POBuyer,
	            $row->TglPI ? date('d-M-y', strtotime($row->TglPI)) : '',
	            $row->kode_byr,
	            $item,
	            $row->Qty . ' ' . $row->Satuan,
	            $row->CBM,
	            ($row->CBM) * ($row->Qty),
	            '$' . number_format($row->Press, 2),
	            '$' . number_format($row->SubTotal, 2),
	             $row->TglPoSup ? date('d-M-y', strtotime($row->TglPoSup)) : '',
	             $supplier_po_details, // Menampilkan PO Actual Supplier
	             $row->TglBrgDtg ? date('d-M-y', strtotime($row->TglBrgDtg)) : '',
	             $supplier_po_lpb_details,
	             $row->TglPoCtnSup ? date('d-M-y', strtotime($row->TglPoCtnSup)) : '',
	             $karton_po_details, // Menampilkan PO Karton
	             $row->TglBrgCtnDtg ? date('d-M-y', strtotime($row->TglBrgCtnDtg)) : '',
	             $karton_po_lpb_details,
	             $row->TglKdHbSprtMulai ? date('d-M-y', strtotime($row->TglKdHbSprtMulai)) : '',
                 //$row->TglKdHbSprtMulaiAktual ? date('d-M-y', strtotime($row->TglKdHbSprtMulaiAktual)) : '',
                 $kd_details,
                 
	             $row->TglKdHbSprtSelesai ? date('d-M-y', strtotime($row->TglKdHbSprtSelesai)) : '',
                 // $row->TglKdHbSprtSelesaiAktual ? date('d-M-y', strtotime($row->TglKdHbSprtSelesaiAktual)) : '',
                 $kd_selesai_details,

	             $row->TglPembMulai ? date('d-M-y', strtotime($row->TglPembMulai)) : '',
                 //$row->TglPembMulaiAktual ? date('d-M-y', strtotime($row->TglPembMulaiAktual)) : '',
                 $pembahanan_details, 

	             $row->TglPembSelesai ? date('d-M-y', strtotime($row->TglPembSelesai)) : '',
                 // $row->TglPembSelesaiAktual ? date('d-M-y', strtotime($row->TglPembSelesaiAktual)) : '',
                 $pembahanan_selesai_details,

	             $row->TglFinMulai ? date('d-M-y', strtotime($row->TglFinMulai)) : '',
                 //$row->TglFinMulaiAktual ? date('d-M-y', strtotime($row->TglFinMulaiAktual)) : '',
                 $finishing_details,
                 
	             $row->TglFinSelesai ? date('d-M-y', strtotime($row->TglFinSelesai)) : '',
                 // $row->TglFinSelesaiAktual ? date('d-M-y', strtotime($row->TglFinSelesaiAktual)) : '',
                 $finishing_selesai_details,

	             $row->TglFitMulai ? date('d-M-y', strtotime($row->TglFitMulai)) : '',
                 //$row->TglFitMulaiAktual ? date('d-M-y', strtotime($row->TglFitMulaiAktual)) : '',
                 $fitting_details,

	             $row->TglFitSelesai ? date('d-M-y', strtotime($row->TglFitSelesai)) : '',
                 // $row->TglFitSelesaiAktual ? date('d-M-y', strtotime($row->TglFitSelesaiAktual)) : '',
                 $fitting_selesai_details,
                 
	             $row->TglPackMulai ? date('d-M-y', strtotime($row->TglPackMulai)) : '',
                 //$row->TglPackMulaiAktual ? date('d-M-y', strtotime($row->TglPackMulaiAktual)) : '',
                 $packing_details,
                 
	             $row->TglPackSelesai ? date('d-M-y', strtotime($row->TglPackSelesai)) : '',
                 // $row->TglPackSelesaiAktual ? date('d-M-y', strtotime($row->TglPackSelesaiAktual)) : '',
                 $packing_selesai_details,
                 
	             $row->TglFri ? date('d-M-y', strtotime($row->TglFri)) : '',
                 // $row->TglFriAktual ? date('d-M-y', strtotime($row->TglFriAktual)) : '',
                 $fri_details,
                 
	             $row->TglStuffing ? date('d-M-y', strtotime($row->TglStuffing)) : '',
                 // $row->TglStuffingAktual ? date('d-M-y', strtotime($row->TglStuffing)) : '',
                 $stuffing_details,
                 
	             $row->TglShip ? date('d-M-y', strtotime($row->TglShip)) : '',
                 $shipment_details,
	             $daysLateDisplay,
	             $row->Cabang,
	        );
	    }

	    $result = array(
	        "draw" => $draw,
	        "recordsTotal" => $query->num_rows(),
	        "recordsFiltered" => $query->num_rows(),
	        "data" => $data
	    );

	    header('Access-Control-Allow-Origin: *');
	    echo json_encode($result);
	}




}