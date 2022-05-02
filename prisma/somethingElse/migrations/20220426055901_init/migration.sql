-- CreateTable
CREATE TABLE "trick" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "animation" VARCHAR(255),
    "numberOfBalls" INTEGER NOT NULL,

    CONSTRAINT "trick_pkey" PRIMARY KEY ("id")
);
