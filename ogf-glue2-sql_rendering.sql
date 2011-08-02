SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `gluedb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `gluedb` ;

-- -----------------------------------------------------
-- Table `gluedb`.`ComputingManager`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingManager` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Reservation` VARCHAR(1024) NULL DEFAULT NULL ,
  `BulkSubmission` VARCHAR(1024) NULL DEFAULT NULL ,
  `TotalPhysicalCPUs` INT NULL DEFAULT NULL ,
  `TotalLogicalCPUs` INT NULL DEFAULT NULL ,
  `TotalSlots` INT NULL DEFAULT NULL ,
  `SlotsUsedByLocalJobs` INT NULL DEFAULT NULL ,
  `SlotsUsedByGridJobs` INT NULL DEFAULT NULL ,
  `Homogeneous` VARCHAR(1024) NULL DEFAULT NULL ,
  `LogicalCPUDistribution` VARCHAR(1024) NULL DEFAULT NULL ,
  `WorkingAreaShared` VARCHAR(1024) NULL DEFAULT NULL ,
  `WorkingAreaGuaranteed` VARCHAR(1024) NULL DEFAULT NULL ,
  `WorkingAreaTotal` BIGINT NULL DEFAULT NULL ,
  `WorkingAreaFree` BIGINT NULL DEFAULT NULL ,
  `WorkingAreaLifeTime` BIGINT NULL DEFAULT NULL ,
  `WorkingAreaMultiSlotTotal` BIGINT NULL DEFAULT NULL ,
  `WorkingAreaMultiSlotFree` BIGINT NULL DEFAULT NULL ,
  `WorkingAreaMultiSlotLifeTime` BIGINT NULL DEFAULT NULL ,
  `CacheTotal` BIGINT NULL DEFAULT NULL ,
  `CacheFree` BIGINT NULL DEFAULT NULL ,
  `TmpDir` VARCHAR(1024) NULL DEFAULT NULL ,
  `ScratchDir` VARCHAR(1024) NULL DEFAULT NULL ,
  `ApplicationDir` VARCHAR(1024) NULL DEFAULT NULL ,
  `ComputingServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingShare`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingShare` (
  `ID` VARCHAR(1024) NOT NULL ,
  `MappingQueue` VARCHAR(1024) NULL DEFAULT NULL ,
  `MaxWallTime` BIGINT NULL DEFAULT NULL ,
  `MaxMultiSlotWallTime` BIGINT NULL DEFAULT NULL ,
  `MinWallTime` BIGINT NULL DEFAULT NULL ,
  `DefaultWallTime` BIGINT NULL DEFAULT NULL ,
  `MaxCPUTime` BIGINT NULL DEFAULT NULL ,
  `MaxTotalCPUTime` BIGINT NULL DEFAULT NULL ,
  `MinCPUTime` BIGINT NULL DEFAULT NULL ,
  `DefaultCPUTime` BIGINT NULL DEFAULT NULL ,
  `MaxTotalJobs` INT NULL DEFAULT NULL ,
  `MaxRunningJobs` INT NULL DEFAULT NULL ,
  `MaxWaitingJobs` INT NULL DEFAULT NULL ,
  `MaxPreLRMSWaitingJobs` INT NULL DEFAULT NULL ,
  `MaxUserRunningJobs` INT NULL DEFAULT NULL ,
  `MaxSlotsPerJob` INT NULL DEFAULT NULL ,
  `MaxStageInStreams` INT NULL DEFAULT NULL ,
  `MaxStageOutStreams` INT NULL DEFAULT NULL ,
  `SchedulingPolicy` VARCHAR(1024) NULL DEFAULT NULL ,
  `MaxMainMemory` BIGINT NULL DEFAULT NULL ,
  `GuaranteedMainMemory` BIGINT NULL DEFAULT NULL ,
  `MaxVirtualMemory` BIGINT NULL DEFAULT NULL ,
  `GuaranteedVirtualMemory` BIGINT NULL DEFAULT NULL ,
  `MaxDiskSpace` BIGINT NULL DEFAULT NULL ,
  `DefaultStorageService` VARCHAR(1024) NULL DEFAULT NULL ,
  `Preemption` VARCHAR(1024) NULL DEFAULT NULL ,
  `ServingState` VARCHAR(1024) NOT NULL ,
  `TotalJobs` INT NULL DEFAULT NULL ,
  `RunningJobs` INT NULL DEFAULT NULL ,
  `LocalRunningJobs` INT NULL DEFAULT NULL ,
  `WaitingJobs` INT NULL DEFAULT NULL ,
  `LocalWaitingJobs` INT NULL DEFAULT NULL ,
  `SuspendedJobs` INT NULL DEFAULT NULL ,
  `LocalSuspendedJobs` INT NULL DEFAULT NULL ,
  `StagingJobs` INT NULL DEFAULT NULL ,
  `PreLRMSWaitingJobs` INT NULL DEFAULT NULL ,
  `EstimatedAverageWaitingTime` BIGINT NULL DEFAULT NULL ,
  `EstimatedWorstWaitingTime` BIGINT NULL DEFAULT NULL ,
  `FreeSlots` INT NULL DEFAULT NULL ,
  `FreeSlotsWithDuration` VARCHAR(1024) NULL DEFAULT NULL ,
  `UsedSlots` INT NULL DEFAULT NULL ,
  `RequestedSlots` INT NULL DEFAULT NULL ,
  `ReservationPolicy` VARCHAR(1024) NULL DEFAULT NULL ,
  `ComputingServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingService`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingService` (
  `ID` VARCHAR(1024) NOT NULL ,
  `TotalJobs` INT NULL DEFAULT NULL ,
  `RunningJobs` INT NULL DEFAULT NULL ,
  `WaitingJobs` INT NULL DEFAULT NULL ,
  `StagingJobs` INT NULL DEFAULT NULL ,
  `SuspendedJobs` INT NULL DEFAULT NULL ,
  `PreLRMSWaitingJobs` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingEndpoint`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingEndpoint` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Staging` VARCHAR(1024) NULL DEFAULT NULL ,
  `TotalJobs` INT NULL DEFAULT NULL ,
  `RunningJobs` INT NULL DEFAULT NULL ,
  `WaitingJobs` INT NULL DEFAULT NULL ,
  `StagingJobs` INT NULL DEFAULT NULL ,
  `SuspendedJobs` INT NULL DEFAULT NULL ,
  `PreLRMSWaitingJobs` INT NULL DEFAULT NULL ,
  `ComputingServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Benchmark`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Benchmark` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` DOUBLE NOT NULL ,
  `ComputingManagerID` VARCHAR(1024) NULL DEFAULT NULL ,
  `ExecutionEnvironmentID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ApplicationEnvironment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ApplicationEnvironment` (
  `ID` VARCHAR(1024) NOT NULL ,
  `AppName` VARCHAR(1024) NOT NULL ,
  `AppVersion` VARCHAR(1024) NULL DEFAULT NULL ,
  `Repository` VARCHAR(1024) NULL DEFAULT NULL ,
  `State` VARCHAR(1024) NULL DEFAULT NULL ,
  `RemovalDate` VARCHAR(1024) NULL DEFAULT NULL ,
  `License` VARCHAR(1024) NULL DEFAULT NULL ,
  `Description` VARCHAR(1024) NULL DEFAULT NULL ,
  `ParallelSupport` VARCHAR(1024) NULL DEFAULT NULL ,
  `MaxSlots` INT NULL DEFAULT NULL ,
  `MaxJobs` INT NULL DEFAULT NULL ,
  `MaxUserSeats` INT NULL DEFAULT NULL ,
  `FreeSlots` INT NULL DEFAULT NULL ,
  `FreeJobs` INT NULL DEFAULT NULL ,
  `FreeUserSeats` INT NULL DEFAULT NULL ,
  `ComputingManagerID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ToStorageService`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ToStorageService` (
  `ID` VARCHAR(1024) NOT NULL ,
  `LocalPath` VARCHAR(1024) NOT NULL ,
  `RemotePath` VARCHAR(1024) NOT NULL ,
  `ComputingServiceID` VARCHAR(1024) NOT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingActivity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingActivity` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NULL DEFAULT NULL ,
  `IDFromEndpoint` VARCHAR(1024) NULL DEFAULT NULL ,
  `LocalIDFromManager` VARCHAR(1024) NULL DEFAULT NULL ,
  `JobDescription` VARCHAR(1024) NULL DEFAULT NULL ,
  `ExitCode` INT NULL DEFAULT NULL ,
  `ComputingManagerExitCode` VARCHAR(1024) NULL DEFAULT NULL ,
  `WaitingPosition` INT NULL DEFAULT NULL ,
  `UserDomain` VARCHAR(1024) NULL DEFAULT NULL ,
  `Owner` VARCHAR(1024) NOT NULL ,
  `LocalOwner` VARCHAR(1024) NULL DEFAULT NULL ,
  `RequestedTotalWallTime` BIGINT NULL DEFAULT NULL ,
  `RequestedTotalCPUTime` BIGINT NULL DEFAULT NULL ,
  `RequestedSlots` INT NULL DEFAULT NULL ,
  `StdIn` VARCHAR(1024) NULL DEFAULT NULL ,
  `StdOut` VARCHAR(1024) NULL DEFAULT NULL ,
  `StdErr` VARCHAR(1024) NULL DEFAULT NULL ,
  `LogDir` VARCHAR(1024) NULL DEFAULT NULL ,
  `Queue` VARCHAR(1024) NULL DEFAULT NULL ,
  `UsedTotalWallTime` BIGINT NULL DEFAULT NULL ,
  `UsedTotalCPUTime` BIGINT NULL DEFAULT NULL ,
  `UsedMainMemory` BIGINT NULL DEFAULT NULL ,
  `SubmissionTime` DATETIME NULL DEFAULT NULL ,
  `ComputingManagerSubmissionTime` DATETIME NULL DEFAULT NULL ,
  `StartTime` DATETIME NULL DEFAULT NULL ,
  `ComputingManagerEndTime` DATETIME NULL DEFAULT NULL ,
  `EndTime` DATETIME NULL DEFAULT NULL ,
  `WorkingAreaEraseTime` DATETIME NULL DEFAULT NULL ,
  `ProxyExpirationTime` DATETIME NULL DEFAULT NULL ,
  `SubmissionHost` VARCHAR(1024) NULL DEFAULT NULL ,
  `SubmissionClientName` VARCHAR(1024) NULL DEFAULT NULL ,
  `ComputingEndpointID` VARCHAR(1024) NULL DEFAULT NULL ,
  `ComputingShareID` VARCHAR(1024) NULL DEFAULT NULL ,
  `ExecutionEnvironmentID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ApplicationHandle`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ApplicationHandle` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  `ApplicationEnvironmentID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ExecutionEnvironment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ExecutionEnvironment` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Platform` VARCHAR(1024) NOT NULL ,
  `VirtualMachine` VARCHAR(1024) NULL DEFAULT NULL ,
  `TotalInstances` INT NULL DEFAULT NULL ,
  `UsedInstances` INT NULL DEFAULT NULL ,
  `UnavailableInstances` INT NULL DEFAULT NULL ,
  `PhysicalCPUs` INT NULL DEFAULT NULL ,
  `LogicalCPUs` INT NULL DEFAULT NULL ,
  `CPUMultiplicity` VARCHAR(1024) NULL DEFAULT NULL ,
  `CPUVendor` VARCHAR(1024) NULL DEFAULT NULL ,
  `CPUModel` VARCHAR(1024) NULL DEFAULT NULL ,
  `CPUVersion` VARCHAR(1024) NULL DEFAULT NULL ,
  `CPUClockSpeed` INT NULL DEFAULT NULL ,
  `CPUTimeScalingFactor` DOUBLE NULL DEFAULT NULL ,
  `WallTimeScalingFactor` DOUBLE NULL DEFAULT NULL ,
  `MainMemorySize` BIGINT NOT NULL ,
  `VirtualMemorySize` BIGINT NULL DEFAULT NULL ,
  `OSFamily` VARCHAR(1024) NOT NULL ,
  `OSName` VARCHAR(1024) NULL DEFAULT NULL ,
  `OSVersion` VARCHAR(1024) NULL DEFAULT NULL ,
  `ConnectivityIn` VARCHAR(1024) NOT NULL ,
  `ConnectivityOut` VARCHAR(1024) NOT NULL ,
  `ComputingManagerID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingEndpoint_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingEndpoint_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingManager_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingManager_MVA` (
  `Id` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`Id`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ExecutionEnvironment_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ExecutionEnvironment_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ApplicationEnvironment_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ApplicationEnvironment_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingActivity_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingActivity_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingShare_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingShare_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Location`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Location` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Address` VARCHAR(1024) NULL DEFAULT NULL ,
  `Place` VARCHAR(1024) NULL DEFAULT NULL ,
  `Country` VARCHAR(1024) NULL DEFAULT NULL ,
  `PostCode` VARCHAR(1024) NULL DEFAULT NULL ,
  `Latitude` DOUBLE NULL DEFAULT NULL ,
  `Longitude` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Activity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Activity` (
  `ID` VARCHAR(1024) NOT NULL ,
  `UserDomainID` VARCHAR(1024) NULL DEFAULT NULL ,
  `EndpointID` VARCHAR(1024) NULL DEFAULT NULL ,
  `ShareID` VARCHAR(1024) NULL DEFAULT NULL ,
  `ResourceID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`AdminDomain`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`AdminDomain` (
  `ID` VARCHAR(1024) NOT NULL COMMENT 'ID should not use as a foreign key ID from entity bu rather from Domain.' ,
  `Distributed` VARCHAR(1024) NULL DEFAULT NULL ,
  `AdminDomainID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Contact`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Contact` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Detail` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL COMMENT 'Type Should be ContactType_t' ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Service`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Service` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `QualityLevel` VARCHAR(1024) NOT NULL ,
  `Complexity` VARCHAR(1024) NULL DEFAULT NULL ,
  `LocationID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Endpoint`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Endpoint` (
  `ID` VARCHAR(1024) NOT NULL ,
  `URL` VARCHAR(1024) NOT NULL ,
  `Technology` VARCHAR(1024) NULL DEFAULT NULL ,
  `InterfaceName` VARCHAR(1024) NOT NULL ,
  `Implementor` VARCHAR(1024) NULL DEFAULT NULL ,
  `ImplementationName` VARCHAR(1024) NULL DEFAULT NULL ,
  `ImplementationVersion` VARCHAR(1024) NULL DEFAULT NULL ,
  `QualityLevel` VARCHAR(1024) NOT NULL ,
  `HealthState` VARCHAR(1024) NOT NULL ,
  `HealthStateInfo` VARCHAR(1024) NULL DEFAULT NULL ,
  `ServingState` VARCHAR(1024) NOT NULL ,
  `StartTime` DATETIME NULL DEFAULT NULL ,
  `IssuerCA` VARCHAR(1024) NULL DEFAULT NULL ,
  `DowntimeAnnounce` DATETIME NULL DEFAULT NULL ,
  `DowntimeStart` DATETIME NULL DEFAULT NULL ,
  `DowntimeEnd` DATETIME NULL DEFAULT NULL ,
  `DowntimeInfo` VARCHAR(1024) NULL DEFAULT NULL ,
  `ServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`AccessPolicy`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`AccessPolicy` (
  `ID` VARCHAR(1024) NOT NULL ,
  `EndpointID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`UserDomain`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`UserDomain` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Level` INT NULL DEFAULT NULL ,
  `UserDomainID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`MappingPolicy`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`MappingPolicy` (
  `ID` VARCHAR(1024) NOT NULL ,
  `ShareID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Domain`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Domain` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Description` VARCHAR(1024) NULL DEFAULT NULL ,
  `LocationID` VARCHAR(1024) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Policy`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Policy` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Scheme` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Share`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Share` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Description` VARCHAR(1024) NULL DEFAULT NULL ,
  `ServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Manager`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Manager` (
  `ID` VARCHAR(1024) NOT NULL ,
  `ProductName` VARCHAR(1024) NOT NULL ,
  `ProductVersion` VARCHAR(1024) NULL ,
  `ServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Resource`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Resource` (
  `ID` VARCHAR(1024) NOT NULL ,
  `ManagerID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Domain_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Domain_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`AdminDomain_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`AdminDomain_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`UserDomain_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`UserDomain_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Service_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Service_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Endpoint_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Endpoint_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Policy_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Policy_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Extension`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Extension` (
  `LocalID` VARCHAR(1024) NOT NULL ,
  `Key` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  `EntityID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`LocalID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageService`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageService` (
  `ID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageServiceCapacity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageServiceCapacity` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `TotalSize` BIGINT NULL DEFAULT NULL ,
  `FreeSize` BIGINT NULL DEFAULT NULL ,
  `UsedSize` BIGINT NULL DEFAULT NULL ,
  `ReservedSize` BIGINT NULL DEFAULT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageAccessProtocol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageAccessProtocol` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Version` VARCHAR(1024) NOT NULL ,
  `MaxStreams` INT NULL DEFAULT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageEndpoint`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageEndpoint` (
  `ID` VARCHAR(1024) NOT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageShare`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageShare` (
  `ID` VARCHAR(1024) NOT NULL ,
  `ServingState` VARCHAR(1024) NOT NULL ,
  `Path` VARCHAR(1024) NULL DEFAULT NULL ,
  `SharingID` VARCHAR(1024) NOT NULL ,
  `AccessLatency` VARCHAR(1024) NOT NULL ,
  `DefaultLifeTime` INT NULL DEFAULT NULL ,
  `MaximumLifeTime` INT NULL DEFAULT NULL ,
  `Tag` VARCHAR(1024) NULL DEFAULT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageShareCapacity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageShareCapacity` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `TotalSize` BIGINT NULL DEFAULT NULL ,
  `FreeSize` BIGINT NULL DEFAULT NULL ,
  `UsedSize` BIGINT NULL DEFAULT NULL ,
  `ReservedSize` BIGINT NULL DEFAULT NULL ,
  `StorageShareID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageManager`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageManager` (
  `ID` VARCHAR(1024) NOT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`DataStore`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`DataStore` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Latency` VARCHAR(1024) NOT NULL ,
  `TotalSize` BIGINT NULL DEFAULT NULL ,
  `FreeSize` BIGINT NULL DEFAULT NULL ,
  `UsedSize` BIGINT NULL DEFAULT NULL ,
  `StorageManagerID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ToComputingService`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ToComputingService` (
  `ID` VARCHAR(1024) NOT NULL ,
  `NetworkInfo` VARCHAR(1024) NULL DEFAULT NULL ,
  `Bandwidth` BIGINT NULL DEFAULT NULL ,
  `ComputingServiceID` VARCHAR(1024) NOT NULL ,
  `StorageServiceID` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Entity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Entity` (
  `ID` VARCHAR(1024) NOT NULL ,
  `CreationTime` DATETIME NULL ,
  `Validity` BIGINT NULL ,
  `Name` VARCHAR(1024) NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`Entity_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Entity_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`Location_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Location_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`Contact_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Contact_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`Share_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Share_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`Manager_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Manager_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Resource_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Resource_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`Activity_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`Activity_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ComputingService_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ComputingService_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gluedb`.`StorageAccessProtocol_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageAccessProtocol_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageEndpoint_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageEndpoint_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`StorageShare_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`StorageShare_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );


-- -----------------------------------------------------
-- Table `gluedb`.`ToComputingService_MVA`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gluedb`.`ToComputingService_MVA` (
  `ID` VARCHAR(1024) NOT NULL ,
  `Type` VARCHAR(1024) NOT NULL ,
  `Value` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`ID`, `Type`, `Value`) );



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
