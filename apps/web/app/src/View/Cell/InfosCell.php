<?php

namespace App\View\Cell;

use Cake\View\Cell;

class InfosCell extends Cell
{


	public function display()
	{
	}


	public function preview_url($page_slug, $data, $args = [])
	{
		$preview_url = "/{$page_slug}/{$data->id}?preview=on";

		$this->set(compact('preview_url'));
	}
}
