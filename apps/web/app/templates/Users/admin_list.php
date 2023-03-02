<!-- DataTables CSS -->
<?php
    echo $this->Html->css(array(
        '../template_admin/vendor/datatables-plugins/dataTables.bootstrap.css',
        '../template_admin/vendor/datatables-responsive/dataTables.responsive.css',
    ));
?>
<!-- DataTables JavaScript -->
<?php
    echo $this->Html->script(array(
        '../template_admin/vendor/datatables/js/jquery.dataTables.min.js',
        '../template_admin/vendor/datatables-plugins/dataTables.bootstrap.min.js',
        '../template_admin/vendor/datatables-responsive/dataTables.responsive.js',
    ));
?>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
$(document).ready(function() {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});
</script>
<div id="wrapper">
        <!-- Navigation -->
        <?php echo $this->element('admin/navigate');?>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Users</h1>
                    <?php echo $this->Session->flash();?>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Users
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID User</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Groups</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($users as $key => $val){
                                    ?>
                                    <tr>
                                        <td><?php echo $val['User']['id']?></td>
                                        <td><?php echo $val['User']['name']?></td>
                                        <td><?php echo $val['User']['username']?></td>
                                        <td><?php echo $val['User']['email']?></td>
                                        <td><?php echo $val['User']['groups']?></td>
                                        <td>
                                            <?php echo $this->Html->link('Edit',array('controller'=>'users','action'=>'edit',$val['User']['id']), array('class' => 'btn btn-warning'));
                                            ?>
                                            <?php echo $this->Html->link('Del',array('controller'=>'users','action'=>'delete',$val['User']['id']), array('class' => 'btn btn-danger'));
                                            ?>
                                        </td>
                                    </tr>
                                    <?php }?>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>