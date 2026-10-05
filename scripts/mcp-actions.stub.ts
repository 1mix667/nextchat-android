// Static-export stub for app/mcp/actions.ts.
//
// Next.js static export (`output: "export"`) does not support Server Actions
// ("use server"). The real actions.ts is a server-actions module, so building
// with BUILD_MODE=export fails with:
//   "Server Actions are not supported with static export."
// During an app/export build this stub (no "use server" directive) temporarily
// replaces app/mcp/actions.ts — see scripts/export-static.sh.
// MCP is a server-side feature and is disabled by default (ENABLE_MCP),
// so the exported Android app behaves the same as a default build: MCP off.

import type {
  ListToolsResponse,
  McpConfigData,
  McpRequestMessage,
  ServerConfig,
  ServerStatusResponse,
} from "@/app/mcp/types";

export async function getClientsStatus(): Promise<
  Record<string, ServerStatusResponse>
> {
  return {};
}

export async function getClientTools(
  _clientId: string,
): Promise<unknown[] | null> {
  return null;
}

export async function getAvailableClientsCount(): Promise<number> {
  return 0;
}

export async function getAllTools(): Promise<
  { clientId: string; tools: ListToolsResponse | null }[]
> {
  return [];
}

export async function initializeMcpSystem(): Promise<McpConfigData> {
  // MCP is unavailable in static-export builds.
  return { mcpServers: {} };
}

export async function addMcpServer(
  _clientId: string,
  _config: ServerConfig,
): Promise<McpConfigData> {
  // MCP is unavailable in static-export builds.
  return { mcpServers: {} };
}

export async function pauseMcpServer(
  _clientId: string,
): Promise<McpConfigData> {
  // MCP is unavailable in static-export builds.
  return { mcpServers: {} };
}

export async function resumeMcpServer(_clientId: string): Promise<void> {
  // MCP is unavailable in static-export builds.
}

export async function removeMcpServer(
  _clientId: string,
): Promise<McpConfigData> {
  // MCP is unavailable in static-export builds.
  return { mcpServers: {} };
}

export async function restartAllClients(): Promise<McpConfigData> {
  // MCP is unavailable in static-export builds.
  return { mcpServers: {} };
}

export async function executeMcpAction(
  _clientId: string,
  _request: McpRequestMessage,
): Promise<never> {
  throw new Error("MCP is not supported in the exported app build");
}

export async function getMcpConfigFromFile(): Promise<McpConfigData> {
  return { mcpServers: {} };
}

export async function isMcpEnabled(): Promise<boolean> {
  return false;
}
