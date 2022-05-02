import { PrismaClient } from "@prisma/client";
import allTricks from "./data/allTricks.json";

const prisma = new PrismaClient();

async function main() {
  // await prisma.trick.create(
  //     {data: {
  //         name: "connect",
  //         animation: "https://libraryofjuggling.com/JugglingGifs/3balltricks/3ballcascade.gif",
  //         numberOfBalls: 3,
  //         prereq: {
  //           connect: [{ 
  //           id:1
  //           }]
  //         }
  //     }}
  // )

  // const post = await prisma.trick.update({
  //   where: { id: 2 },
  //   data: {
  //     numberOfBalls: 3,
  //   },
  // });

  allTricks.forEach(async trick => {
    await prisma.trick.create(
      {data: {
        name: trick.name,
        animation: trick.animation,
        numberOfBalls: trick.balls,
        // prereq: {
        //   connect : trick.prereq ?? [] /// needs to reference Id
        // }
      }}
    )
  })

  const tricksFindMany = await prisma.trick.findMany({ // how to "load the nested objects"
    include: {
      prereq: true,
    },
  });
  const withpre = await prisma.trick.findMany();


  



  
  console.log(allTricks);
  console.log(tricksFindMany[1].prereq[0].name)
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
