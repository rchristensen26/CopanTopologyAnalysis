
# rule getGraphLinks:
#     input:
#         join(config["outputDir"], (join(config["graphDir"], "{graph_id}.gfa")))
#     output:
#         join(config["tempDir"], config["linksDir"], "{graph_id}_links.json")
#     shell:
#         """
#         cp {input} {config[tempDir]}/

#         python3 workflow/scripts/get_graph_links.py {config[tempDir]}/{wildcards.graph_id}.gfa {output}
#         """

rule getGraphLinks:
    input:
        join(config["storageDir"], config["graphDir"], "{graph_id}.gfa")
    output:
        join(config["tempDir"], config["linksDir"], "{graph_id}_links.json")
    shell:
        """
        mkdir -p {config[tempDir]}/{config[linksDir]}

        cp {input} {config[tempDir]}/{config[graphDir]}/

        mkdir -p {config[tempDir]}/{config[linksDir]}

        python3 workflow/scripts/get_graph_links.py {config[tempDir]}/{wildcards.graph_id}.gfa {output}
        """