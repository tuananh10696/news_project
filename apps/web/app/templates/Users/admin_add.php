<div id="wrapper">
        <!-- Navigation -->
        <?php echo $this->element('admin/navigate');?>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Users
                    <button onclick="window.location.href='/admin/users/list'" style="float: right;" type="button" class="btn btn-primary">Danh sách</button>
                    </h1>
                    <?php echo $this->Session->flash();?>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Add user
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <?php echo $this->Form->create(array('id'=>'appForm', 'inputDefaults'=>array('label'=>false, 'div'=>false))); ?>
                                        <div class="form-group">
                                            <label>Username</label>
                                            <?php echo $this->Form->input('username', array('class'=>'form-control')); ?> 
                                        </div>
                                        <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <?php echo $this->Form->input('password', array('class'=>'form-control')); ?>
                                        </div>
                                        <div class="form-group">
                                            <label>Nhập lại mật khẩu</label>
                                            <?php echo $this->Form->input('confirm_password', array('type'=>'password', 'class'=>'form-control')); ?>
                                        </div>
                                        <div class="form-group">
                                            <label>Họ và tên</label>
                                           <?php echo $this->Form->input('name', array('class'=>'form-control', )); ?>
                                        </div>
                                        <div class="form-group">
                                            <label>Email:</label><br />
                                            <?php echo $this->Form->input('email', array('class'=>'form-control')); ?>
                                        </div>
                                        <div class="form-group">
                                            <label>Groups</label>
                                            <?php $arr_groups = array("admin" => "Admin", "user"=> "User", "gold_user"=>"Gold user");?>
                                            <?php echo $this->Form->select('groups',$arr_groups,array('class'=>'form-control','empty' => false));?>
                                        </div>
                                        <button id="linkUpdate" type="submit" class="btn btn-success">Save</button>
                                        <button type="button" onclick="window.location.href='/admin/users/list'" class="btn btn-info">Danh sách</button>
                                    <?php echo $this->Form->end();?>
                                </div>
                            </div>
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