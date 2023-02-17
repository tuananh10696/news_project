<?php

namespace App\Validator;

use App\Model\Entity\Info;

class InfoValidation
{

    public static function checkFilename($value, $context)
    {
        return true;
    }


    public static function checkFileEmpty($value, $context)
    {
        if (array_key_exists('block_type', $context['data'])) {
            if ($context['data']['block_type'] == Info::BLOCK_TYPE_FILE) {
                if (empty($value)) {
                    return false;
                } else {
                    return true;
                }
            }
        }
    }
}
