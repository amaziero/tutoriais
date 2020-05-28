import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// code to create user
prisma.user
  .create({
    data: {
      name: "Username3",
      email: "user_tes3t@test.com",
      Post: {
        create: [{ title: "Exemplo 1" }],
      },
    },
  })
  .then(() => {});

// code to get all users
async function main() {
  const allUsers = await prisma.user.findMany();
  const allPosts = await prisma.post.findMany();

  console.log([allUsers, allPosts]);
}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.disconnect();
  });
