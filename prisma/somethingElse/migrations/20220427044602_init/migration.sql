-- AlterTable
ALTER TABLE "trick" ADD COLUMN     "cat" TEXT;

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
