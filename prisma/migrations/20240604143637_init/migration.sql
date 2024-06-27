-- DropForeignKey
ALTER TABLE `image` DROP FOREIGN KEY `image_productId_fkey`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `review_productId_fkey`;

-- AddForeignKey
ALTER TABLE `image` ADD CONSTRAINT `image_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
