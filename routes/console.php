<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Schedule::command('rtb:update-slot-status')->everyMinute();
Schedule::command('rtb:evaluate-ended-slots')->everyMinute();
Schedule::command('rtb:update-slot-status')->everyMinute();
