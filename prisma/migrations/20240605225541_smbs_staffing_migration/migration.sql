-- CreateTable
CREATE TABLE `CompanyDetails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `CompanyDetails_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CompanyDetailsContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `company_details_id` INTEGER NULL,
    `type` ENUM('title', 'paragraph') NOT NULL,
    `content` VARCHAR(191) NULL,
    `url` VARCHAR(191) NULL,

    UNIQUE INDEX `CompanyDetailsContent_company_details_id_key`(`company_details_id`),
    INDEX `company_details_id`(`company_details_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContactInformation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `ContactInformation_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContactInformationContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contact_information_id` INTEGER NULL,
    `type` ENUM('image', 'paragraph', 'phone_number', 'email') NOT NULL,
    `content` VARCHAR(191) NULL,
    `url` VARCHAR(191) NULL,

    UNIQUE INDEX `ContactInformationContent_contact_information_id_key`(`contact_information_id`),
    INDEX `contact_information_id`(`contact_information_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Page` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReferenceContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reference_id` INTEGER NULL,
    `type` ENUM('title', 'paragraph', 'image', 'name', 'address') NOT NULL,
    `content` VARCHAR(191) NULL,
    `url` VARCHAR(191) NULL,

    UNIQUE INDEX `ReferenceContent_reference_id_key`(`reference_id`),
    INDEX `reference_id`(`reference_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SectionContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `type` ENUM('title', 'paragraph', 'image', 'link') NOT NULL,
    `content` VARCHAR(191) NULL,
    `url` VARCHAR(191) NULL,
    `link_text` VARCHAR(191) NULL,

    UNIQUE INDEX `SectionContent_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SectionReference` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `SectionReference_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Section` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `page_id` INTEGER NULL,

    UNIQUE INDEX `Section_page_id_key`(`page_id`),
    INDEX `page_id`(`page_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ServiceContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `service_id` INTEGER NULL,
    `type` ENUM('title', 'paragraph', 'image', 'link') NOT NULL,
    `content` VARCHAR(191) NULL,
    `url` VARCHAR(191) NULL,
    `link_text` VARCHAR(191) NULL,

    UNIQUE INDEX `ServiceContent_service_id_key`(`service_id`),
    INDEX `service_id`(`service_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Service` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Service_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubscriptionContent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subscription_id` INTEGER NULL,
    `type` ENUM('title', 'subtitle', 'paragraph', 'input_text') NOT NULL,
    `content` VARCHAR(191) NULL,

    UNIQUE INDEX `SubscriptionContent_subscription_id_key`(`subscription_id`),
    INDEX `subscription_id`(`subscription_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subscription` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Subscription_section_id_key`(`section_id`),
    INDEX `section_id`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CompanyDetails` ADD CONSTRAINT `CompanyDetails_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CompanyDetailsContent` ADD CONSTRAINT `CompanyDetailsContent_company_details_id_fkey` FOREIGN KEY (`company_details_id`) REFERENCES `CompanyDetails`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ContactInformation` ADD CONSTRAINT `ContactInformation_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ContactInformationContent` ADD CONSTRAINT `ContactInformationContent_contact_information_id_fkey` FOREIGN KEY (`contact_information_id`) REFERENCES `ContactInformation`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReferenceContent` ADD CONSTRAINT `ReferenceContent_reference_id_fkey` FOREIGN KEY (`reference_id`) REFERENCES `SectionReference`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SectionContent` ADD CONSTRAINT `SectionContent_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SectionReference` ADD CONSTRAINT `SectionReference_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Section` ADD CONSTRAINT `Section_page_id_fkey` FOREIGN KEY (`page_id`) REFERENCES `Page`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ServiceContent` ADD CONSTRAINT `ServiceContent_service_id_fkey` FOREIGN KEY (`service_id`) REFERENCES `Service`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Service` ADD CONSTRAINT `Service_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubscriptionContent` ADD CONSTRAINT `SubscriptionContent_subscription_id_fkey` FOREIGN KEY (`subscription_id`) REFERENCES `Subscription`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Subscription` ADD CONSTRAINT `Subscription_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
