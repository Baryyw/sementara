<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Hash;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->string('username')->unique(); // Ensure usernames are unique
            $table->string('password');
            $table->string('bio', 100);
            $table->boolean('is_private');
            $table->timestamps();
        });

        DB::table('users')->insert([
            'full_name' => 'Admin',
            'username' => 'admin',
            'password' => Hash::make('password'),
            'bio' => 'Administrator',
            'is_private' => false,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
