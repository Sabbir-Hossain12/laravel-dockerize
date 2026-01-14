<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');



//Artisan::command('hello', function () {
//    $this->comment('Hello World from Laravel 11!');
//});
//
//Artisan::command('demo:job', function () {
//    \App\Jobs\DemoJob::dispatch();
//    $this->info('DemoJob dispatched successfully.');
//});
/* |-------------------------------------------------------------------------- | Task Scheduling |-------------------------------------------------------------------------- | | Define scheduled tasks here. The scheduler container running | `php artisan schedule:run` will pick these up. | */
Schedule::call(function () {
    Log::info('Scheduled task ran at ' . now());
})->everyMinute();

Schedule::call(function () {
    \App\Jobs\DemoJob::dispatch();
})->everyMinute();


//Schedule::command('demo:job')->everyFiveMinutes();
