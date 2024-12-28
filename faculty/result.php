
<?php $faculty_id = isset($_GET['fid']) ? $_GET['fid'] : '' ; ?>
<?php 
function ordinal_suffix($num){
    $num = $num % 100; // protect against large numbers
    if($num < 11 || $num > 13){
         switch($num % 10){
            case 1: return $num.'st';
            case 2: return $num.'nd';
            case 3: return $num.'rd';
        }
    }
    return $num.'th';
}
?>
<div class="col-lg-12">
	<div class="callout callout-info">
		<div class="d-flex w-100 justify-content-center align-items-center">
			<label for="faculty">Select Faculty</label>
			<div class=" mx-2 col-md-4">
			<select name="" id="faculty_id" class="form-control form-control-sm select2">
				<option value=""></option>
				<?php 
				$faculty = $conn->query("SELECT *,concat(firstname,' ',lastname) as name FROM faculty_list order by concat(firstname,' ',lastname) asc");
				$f_arr = array();
				$fname = array();
				while($row=$faculty->fetch_assoc()):
					$f_arr[$row['id']]= $row;
					$fname[$row['id']]= ucwords($row['name']);
				?>
				<option value="<?php echo $row['id'] ?>" <?php echo isset($faculty_id) && $faculty_id == $row['id'] ? "selected" : "" ?>><?php echo ucwords($row['name']) ?></option>
				<?php endwhile; ?>
			</select>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 mb-1">
			<div class="d-flex justify-content-end w-100">
				<button class="btn btn-sm btn-success bg-gradient-success" style="display:none" id="print-btn"><i class="fa fa-print"></i> Print</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="callout callout-info">
				<div class="list-group" id="class-list">
					
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="callout callout-info" id="printable">
			<div>
			<h3 class="text-center">Evaluation Report</h3>
			<hr>
			<table width="100%">
					<tr>
						<td width="50%"><p><b>Faculty: <span id="fname"></span></b></p></td>
						<td width="50%"><p><b>Academic Year: <span id="ay"><?php echo $_SESSION['academic']['year'].' '.(ordinal_suffix($_SESSION['academic']['semester'])) ?> Semester</span></b></p></td>
					</tr>
					<tr>
						<td width="50%"><p><b>Class: <span id="classField"></span></b></p></td>
						<td width="50%"><p><b>Subject: <span id="subjectField"></span></b></p></td>
					</tr>
			</table>
				<p class=""><b>Total Student Evaluated: <span id="tse"></span></b></p>
			</div>
			</div>
		</div>
	</div>
</div>
<style>
	.list-group-item:hover{
		color: black !important;
		font-weight: 700 !important;
	}
</style>
<noscript>
	<style>
		table{
			width:100%;
			border-collapse: collapse;
		}
		table.wborder tr,table.wborder td,table.wborder th{
			border:1px solid gray;
			padding: 3px
		}
		table.wborder thead tr{
			background: #6c757d linear-gradient(180deg,#828a91,#6c757d) repeat-x!important;
    		color: #fff;
		}
		.text-center{
			text-align:center;
		} 
		.text-right{
			text-align:right;
		} 
		.text-left{
			text-align:left;
		} 
	</style>
</noscript>
<script>
	$(document).ready(function(){
		$('#faculty_id').change(function(){
			if($(this).val() > 0)
			window.history.pushState({}, null, './index.php?page=report&fid='+$(this).val());
			load_class()
		})
		if($('#faculty_id').val() > 0)
			load_class()
	})
	function load_class(){
		start_load()
		var fname = <?php echo json_encode($fname) ?>;
		$('#fname').text(fname[$('#faculty_id').val()])
		$.ajax({
			url:"ajax.php?action=get_class",
			method:'POST',
			data:{fid:$('#faculty_id').val()},
			error:function(err){
				console.log(err)
				alert_toast("An error occured",'error')
				end_load()
			},
			success:function(resp){
				if(resp){
					resp = JSON.parse(resp)
					if(Object.keys(resp).length <= 0 ){
						$('#class-list').html('<a href="javascript:void(0)" class="list-group-item list-group-item-action disabled">No data to be display.</a>')
					}else{
						$('#class-list').html('')
						Object.keys(resp).map(k=>{
						$('#class-list').append('<a href="javascript:void(0)" data-json=\''+JSON.stringify(resp[k])+'\' data-id="'+resp[k].id+'" class="list-group-item list-group-item-action show-result">'+resp[k].class+' - '+resp[k].subj+'</a>')
						})

					}
				}
			},
			complete:function(){
				end_load()
				anchor_func()
				if('<?php echo isset($_GET['rid']) ?>' == 1){
					$('.show-result[data-id="<?php echo isset($_GET['rid']) ? $_GET['rid'] : '' ?>"]').trigger('click')
				}else{
					$('.show-result').first().trigger('click')
				}
			}
		})
	}
	function anchor_func(){
		$('.show-result').click(function(){
			var vars = [], hash;
			var data = $(this).attr('data-json')
				data = JSON.parse(data)
			var _href = location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			for(var i = 0; i < _href.length; i++)
				{
					hash = _href[i].split('=');
					vars[hash[0]] = hash[1];
				}
			window.history.pushState({}, null, './index.php?page=report&fid='+vars.fid+'&rid='+data.id);
			load_report(vars.fid,data.sid,data.id);
			$('#subjectField').text(data.subj)
			$('#classField').text(data.class)
			$('.show-result.active').removeClass('active')
			$(this).addClass('active')
		})
	}
	function load_report(faculty_id, subject_id, class_id) {
		if ($('#preloader2').length <= 0) start_load();

		$.ajax({
			url: 'ajax.php?action=get_report',
			method: "POST",
			data: { faculty_id: faculty_id, subject_id: subject_id, class_id: class_id },
			error: function (err) {
				console.log(err);
				alert_toast("An Error Occurred.", "error");
				end_load();
			},
			success: function (resp) {
				if (resp) {
					resp = JSON.parse(resp);

					// Clear existing data
					$('.rates').text('-');
					$('#tse').text('');
					$('#print-btn').hide();

					if (Object.keys(resp).length > 0) {
						$('#print-btn').show();
						$('#tse').text(resp.tse);

						var data = resp.data;

						// Initialize total score trackers
						var totalScores = {};

						// Populate data into each question cell and track totals
						Object.keys(data).forEach(questionId => {
							Object.keys(data[questionId]).forEach(rate => {
								const cellSelector = `.rate_${rate}_${questionId}`;
								const rateCell = $(cellSelector);

								if (rateCell.length) {
									// Update cell value
									const value = data[questionId][rate];
									rateCell.text(value);

									// Get the criterion ID (from tbody attribute)
									const criterionId = rateCell.closest('tbody').data('criterion-id');

									// Initialize total scores for the criterion if not already set
									if (!totalScores[criterionId]) {
										totalScores[criterionId] = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
									}

									// Add the value to the corresponding rate total
									totalScores[criterionId][rate] += value;
								}
							});
						});

						// Update total score rows
						Object.keys(totalScores).forEach(criterionId => {
							for (let rate = 1; rate <= 5; rate++) {
								const totalCellSelector = `.total_rate_${criterionId}_${rate}`;
								const totalCell = $(totalCellSelector);
								if (totalCell.length) {
									totalCell.text(totalScores[criterionId][rate]);
								}
							}
						});
					}
				}
			},
			complete: function () {
				end_load();
			}
		});
	}


	$('#print-btn').click(function(){
		start_load()
		var ns =$('noscript').clone()
		var content = $('#printable').html()
		ns.append(content)
		var nw = window.open("Report","_blank","width=900,height=700")
		nw.document.write(ns.html())
		nw.document.close()
		nw.print()
		setTimeout(function(){
			nw.close()
			end_load()
		},750)
	})
</script>