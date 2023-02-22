<?php

namespace App\Form;

use Cake\Form\Form;

class AppForm extends Form
{

    public function checkEmail($value, $context)
    {
        return (bool) preg_match('/\A[a-zA-Z0-9_-]([a-zA-Z0-9_\!#\$%&~\*\+-\/\=\.]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.([a-zA-Z]{2,20})\z/', $value);
    }


    public function checkPostcode($value, $context)
    {
        return (bool) preg_match('/[0-9]{3}-?[0-9]{4}/', $value);
    }


    public function checkTel($value, $context)
    {
        return (bool) preg_match('/^(0\d{1,4}[\s]?\d{1,4}[\s]?\d{4})$/', $value);
    }


    public function checkIsPrivacy($value, $context)
    {
        return intval($value) === 1;
    }


    public function checkKana($value, $context)
    {
        return preg_match("/^[ァ-ヶｦ-ﾟー\s]+$/u", $value);
    }
    

    public function checkHira($value, $context)
    {
        return preg_match("/^[ぁ-ゞー・． 　０-９]+$/u", $value);
    }
}
