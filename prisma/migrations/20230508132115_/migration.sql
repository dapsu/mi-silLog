/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" BIGSERIAL NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "password" VARCHAR(255) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refresh_token" (
    "id" BIGSERIAL NOT NULL,
    "token" VARCHAR(255) NOT NULL,
    "expires_at" TIMESTAMP NOT NULL,
    "user_id" BIGINT NOT NULL,

    CONSTRAINT "refresh_token_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "daily_plans" (
    "id" BIGSERIAL NOT NULL,
    "todo" VARCHAR(100) NOT NULL,
    "date" DATE NOT NULL,
    "user_id" BIGINT NOT NULL,

    CONSTRAINT "daily_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "daily_feedback" (
    "id" BIGSERIAL NOT NULL,
    "feedback" TEXT NOT NULL,
    "daily_plan_id" BIGINT NOT NULL,

    CONSTRAINT "daily_feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" BIGSERIAL NOT NULL,
    "keyword" VARCHAR(50) NOT NULL,
    "daily_plan_id" BIGINT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "daily-completion-per-category" (
    "id" BIGSERIAL NOT NULL,
    "time" TIME NOT NULL,
    "degree_of_completion" INTEGER NOT NULL DEFAULT 0,
    "daily_plan_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL,

    CONSTRAINT "daily-completion-per-category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "todo_details" (
    "id" BIGSERIAL NOT NULL,
    "detail_title" VARCHAR(100) NOT NULL,
    "degree_of_completion" INTEGER NOT NULL DEFAULT 0,
    "daily_plan_id" BIGINT NOT NULL,

    CONSTRAINT "todo_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "timeline-components" (
    "id" BIGSERIAL NOT NULL,
    "todo" VARCHAR(100) NOT NULL,
    "starts_at" TIMESTAMP NOT NULL,
    "ends_at" TIMESTAMP NOT NULL,
    "isDone" BOOLEAN NOT NULL DEFAULT false,
    "todo_detail_id" BIGINT NOT NULL,

    CONSTRAINT "timeline-components_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "refresh_token_user_id_key" ON "refresh_token"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "daily_feedback_daily_plan_id_key" ON "daily_feedback"("daily_plan_id");

-- CreateIndex
CREATE UNIQUE INDEX "Category_daily_plan_id_key" ON "Category"("daily_plan_id");

-- CreateIndex
CREATE UNIQUE INDEX "daily-completion-per-category_daily_plan_id_key" ON "daily-completion-per-category"("daily_plan_id");

-- CreateIndex
CREATE UNIQUE INDEX "daily-completion-per-category_category_id_key" ON "daily-completion-per-category"("category_id");

-- AddForeignKey
ALTER TABLE "refresh_token" ADD CONSTRAINT "refresh_token_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_plans" ADD CONSTRAINT "daily_plans_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_feedback" ADD CONSTRAINT "daily_feedback_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily-completion-per-category" ADD CONSTRAINT "daily-completion-per-category_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily-completion-per-category" ADD CONSTRAINT "daily-completion-per-category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "todo_details" ADD CONSTRAINT "todo_details_daily_plan_id_fkey" FOREIGN KEY ("daily_plan_id") REFERENCES "daily_plans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "timeline-components" ADD CONSTRAINT "timeline-components_todo_detail_id_fkey" FOREIGN KEY ("todo_detail_id") REFERENCES "todo_details"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
