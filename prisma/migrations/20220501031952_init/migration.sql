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

-- CreateTable
CREATE TABLE "_TrickPre" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_TrickPre_AB_unique" ON "_TrickPre"("A", "B");

-- CreateIndex
CREATE INDEX "_TrickPre_B_index" ON "_TrickPre"("B");

-- AddForeignKey
ALTER TABLE "_TrickPre" ADD FOREIGN KEY ("A") REFERENCES "trick"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_TrickPre" ADD FOREIGN KEY ("B") REFERENCES "trick"("id") ON DELETE CASCADE ON UPDATE CASCADE;
