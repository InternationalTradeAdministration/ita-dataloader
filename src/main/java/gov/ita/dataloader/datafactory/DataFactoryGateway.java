package gov.ita.dataloader.datafactory;

public interface DataFactoryGateway {
  PipelineRun getPipelineStatus(String pipelineName);

  void runPipeline(String pipelineName);
}
