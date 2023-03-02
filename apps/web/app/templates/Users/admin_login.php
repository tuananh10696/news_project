<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <?php echo $this->Session->flash();?>
                    <?php echo $this->Form->create();?>
                        <fieldset>
                            <div class="form-group">
                                <?php echo $this->Form->input('username',array('class'=>"form-control", "placeholder"=>"Username", "autofocus"));?>
                            </div>
                            <div class="form-group">
                                <?php echo $this->Form->input('password', array('type'=>'password',"class"=>"form-control", "placeholder"=>"Password"));?>
                            </div>
                        </fieldset>
                    <?php echo $this->Form->button('Login',array('class'=>'btn btn-success'));?>
                </div>
            </div>
        </div>
    </div>
</div>