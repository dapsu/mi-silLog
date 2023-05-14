/*
  Warnings:

  - The primary key for the `daily-completion-per-category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `daily-completion-per-category` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `daily_plan_id` on the `daily-completion-per-category` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `category_id` on the `daily-completion-per-category` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `daily_feedback` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `daily_feedback` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `daily_plan_id` on the `daily_feedback` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `daily_plans` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `daily_plans` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `user_id` on the `daily_plans` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `refresh_token` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `refresh_token` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `user_id` on the `refresh_token` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `timeline-components` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `timeline-components` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `todo_detail_id` on the `timeline-components` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `todo_details` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `todo_details` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `daily_plan_id` on the `todo_details` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `users` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Category" DROP CONSTRAINT "Category_daily_plan_id_fkey";

-- DropForeignKey
ALTER TABLE "daily-completion-per-category" DROP CONSTRAINT "daily-completion-per-category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "daily-completion-per-category" DROP CONSTRAINT "daily-completion-per-category_daily_plan_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_feedback" DROP CONSTRAINT "daily_feedback_daily_plan_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_plans" DROP CONSTRAINT "daily_plans_user_id_fkey";

-- DropForeignKey
ALTER TABLE "refresh_token" DROP CONSTRAINT "refresh_token_user_id_fkey";

-- DropForeignKey
ALTER TABLE "timeline-components" DROP CONSTRAINT "timeline-components_todo_detail_id_fkey";

-- DropForeignKey
ALTER TABLE "todo_details" DROP CONSTRAINT "todo_details_daily_plan_id_fkey";

-- AlterTable
ALTER TABLE "daily-completion-per-category" DROP CONSTRAINT "daily-completion-per-category_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "daily_plan_id" SET DATA TYPE INTEGER,
ALTER COLUMN "category_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "daily-completion-per-category_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "daily_feedback" DROP CONSTRAINT "daily_feedback_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "daily_plan_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "daily_feedback_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "daily_plans" DROP CONSTRAINT "daily_plans_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "user_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "daily_plans_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "refresh_token" DROP CONSTRAINT "refresh_token_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "user_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "refresh_token_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "timeline-components" DROP CONSTRAINT "timeline-components_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "todo_detail_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "timeline-components_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "todo_details" DROP CONSTRAINT "todo_details_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ALTER COLUMN "daily_plan_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "todo_details_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
ALTER COLUMN "id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Category";

-- CreateTable
CREATE TABLE "category" (
    "id" INTEGER NOT NULL,
    "keyword" VARCHAR(50) NOT NULL,
    "daily_plan_id" INTEGER NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "category_daily_plan_id_key" ON "category"("daily_plan_id");

-- AddForeignKey
ALTER TABLE "refresh_token" ADD CONSTRAINT "refresh_token_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_plans" ADD CONSTRAINT "daily_plans_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_feedback" ADD CONSTRAINT "daily_feedback_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "category" ADD CONSTRAINT "category_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily-completion-per-category" ADD CONSTRAINT "daily-completion-per-category_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily-completion-per-category" ADD CONSTRAINT "daily-completion-per-category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "todo_details" ADD CONSTRAINT "todo_details_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "timeline-components" ADD CONSTRAINT "timeline-components_todo_detail_id_fkey" FOREIGN KEY ("todo_detail_id") REFERENCES "todo_details"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
