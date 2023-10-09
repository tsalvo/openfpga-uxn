-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 117
entity sta2_0CLK_37dbf2f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_37dbf2f3;
architecture arch of sta2_0CLK_37dbf2f3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2671_c6_0a59]
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2671_c1_4358]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2671_c2_4aac]
signal n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2672_c3_d1f6[uxn_opcodes_h_l2672_c3_d1f6]
signal printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2677_c11_6649]
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2677_c7_ab34]
signal n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_e3d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2680_c7_65af]
signal t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2680_c7_65af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2680_c7_65af]
signal n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_273c]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2685_c7_9e89]
signal n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_4646]
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2688_c7_f649]
signal t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2688_c7_f649]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2688_c7_f649]
signal n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2689_c3_f203]
signal BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2692_c11_dfd5]
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2692_c7_ffff]
signal n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_3677]
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2695_c7_eea6]
signal n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_64c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2700_c7_5f08]
signal n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_e99f]
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2703_c7_018a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2703_c7_018a]
signal n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2704_c3_5ed0]
signal BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2707_c32_9e1c]
signal BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2707_c32_9ccb]
signal BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2707_c32_77c2]
signal MUX_uxn_opcodes_h_l2707_c32_77c2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2707_c32_77c2_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2710_c32_eb30]
signal CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_54c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2712_c7_81c6]
signal result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2712_c7_81c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2712_c7_81c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2712_c7_81c6]
signal result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2712_c7_81c6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2714_c21_4c70]
signal BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_2df3]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_f090]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2717_c7_f090]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd01( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59
BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left,
BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right,
BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output);

-- t16_MUX_uxn_opcodes_h_l2671_c2_4aac
t16_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac
result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac
result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- n16_MUX_uxn_opcodes_h_l2671_c2_4aac
n16_MUX_uxn_opcodes_h_l2671_c2_4aac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond,
n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue,
n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse,
n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

-- printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6
printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6 : entity work.printf_uxn_opcodes_h_l2672_c3_d1f6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left,
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right,
BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output);

-- t16_MUX_uxn_opcodes_h_l2677_c7_ab34
t16_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34
result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34
result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34
result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34
result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34
result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34
result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34
result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- n16_MUX_uxn_opcodes_h_l2677_c7_ab34
n16_MUX_uxn_opcodes_h_l2677_c7_ab34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond,
n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue,
n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse,
n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output);

-- t16_MUX_uxn_opcodes_h_l2680_c7_65af
t16_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af
result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af
result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af
result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af
result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af
result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- n16_MUX_uxn_opcodes_h_l2680_c7_65af
n16_MUX_uxn_opcodes_h_l2680_c7_65af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond,
n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue,
n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse,
n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output);

-- t16_MUX_uxn_opcodes_h_l2685_c7_9e89
t16_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89
result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89
result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89
result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- n16_MUX_uxn_opcodes_h_l2685_c7_9e89
n16_MUX_uxn_opcodes_h_l2685_c7_9e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond,
n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue,
n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse,
n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output);

-- t16_MUX_uxn_opcodes_h_l2688_c7_f649
t16_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649
result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649
result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- n16_MUX_uxn_opcodes_h_l2688_c7_f649
n16_MUX_uxn_opcodes_h_l2688_c7_f649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond,
n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue,
n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse,
n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203
BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left,
BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right,
BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left,
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right,
BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff
result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff
result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff
result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff
result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff
result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff
result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- n16_MUX_uxn_opcodes_h_l2692_c7_ffff
n16_MUX_uxn_opcodes_h_l2692_c7_ffff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond,
n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue,
n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse,
n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6
result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6
result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6
result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6
result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6
result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- n16_MUX_uxn_opcodes_h_l2695_c7_eea6
n16_MUX_uxn_opcodes_h_l2695_c7_eea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond,
n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue,
n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse,
n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08
result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08
result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08
result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08
result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- n16_MUX_uxn_opcodes_h_l2700_c7_5f08
n16_MUX_uxn_opcodes_h_l2700_c7_5f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond,
n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue,
n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse,
n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a
result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a
result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a
result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a
result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- n16_MUX_uxn_opcodes_h_l2703_c7_018a
n16_MUX_uxn_opcodes_h_l2703_c7_018a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond,
n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue,
n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse,
n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0
BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left,
BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right,
BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c
BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left,
BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right,
BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb
BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left,
BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right,
BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output);

-- MUX_uxn_opcodes_h_l2707_c32_77c2
MUX_uxn_opcodes_h_l2707_c32_77c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2707_c32_77c2_cond,
MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue,
MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse,
MUX_uxn_opcodes_h_l2707_c32_77c2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30
CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x,
CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6
result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond,
result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6
result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6
result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6
result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70
BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left,
BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right,
BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689
CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output,
 t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output,
 t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output,
 t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output,
 t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output,
 t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output,
 MUX_uxn_opcodes_h_l2707_c32_77c2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a5b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2678_c3_dfed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_fadf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3bc9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_6cfb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_9fa3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_564e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2701_c3_0fee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_c7_5f08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2710_c22_cb4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2714_c3_9afb : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2715_c22_e01d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2722_l2667_DUPLICATE_9a28_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a5b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_a5b7;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3bc9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3bc9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse := resize(to_signed(-4, 4), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2678_c3_dfed := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2678_c3_dfed;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_fadf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_fadf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_6cfb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_6cfb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_564e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_564e;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_9fa3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2693_c3_9fa3;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2701_c3_0fee := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2701_c3_0fee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_273c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_c7_5f08_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output := result.ram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2707_c32_9e1c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_left;
     BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output := BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_3677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_left;
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output := BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_64c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_e99f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2671_c6_0a59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_2df3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2715_c22_e01d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2715_c22_e01d_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2692_c11_dfd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_54c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_4646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_left;
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output := BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2677_c11_6649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_left;
     BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output := BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2714_c21_4c70] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_e3d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2707_c32_9e1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c6_0a59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2677_c11_6649_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_e3d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_273c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_4646_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2692_c11_dfd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_3677_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_64c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_e99f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_54c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_2df3_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2714_c3_9afb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2714_c21_4c70_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2689_l2704_l2681_l2696_DUPLICATE_3f59_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2715_c22_e01d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2671_l2695_l2692_DUPLICATE_455f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_52f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_2f3f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2717_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_9d7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_2549_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2688_l2685_l2680_l2703_l2677_l2700_l2695_l2692_DUPLICATE_61ce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2685_l2712_l2680_l2677_l2700_l2671_l2695_l2692_DUPLICATE_29ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2714_c3_9afb;
     -- BIN_OP_OR[uxn_opcodes_h_l2689_c3_f203] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_left;
     BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output := BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2717_c7_f090] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2704_c3_5ed0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_left;
     BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output := BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2712_c7_81c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2712_c7_81c6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2712_c7_81c6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output := result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_f090] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2671_c1_4358] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2707_c32_9ccb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_left;
     BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output := BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2707_c32_9ccb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2689_c3_f203_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2704_c3_5ed0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2697_l2682_DUPLICATE_f689_return_output;
     VAR_printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2671_c1_4358_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_f090_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c7_f090_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2712_c7_81c6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- printf_uxn_opcodes_h_l2672_c3_d1f6[uxn_opcodes_h_l2672_c3_d1f6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2672_c3_d1f6_uxn_opcodes_h_l2672_c3_d1f6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l2710_c32_eb30] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output := CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output;

     -- MUX[uxn_opcodes_h_l2707_c32_77c2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2707_c32_77c2_cond <= VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_cond;
     MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue <= VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iftrue;
     MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse <= VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_return_output := MUX_uxn_opcodes_h_l2707_c32_77c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2712_c7_81c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := VAR_MUX_uxn_opcodes_h_l2707_c32_77c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2712_c7_81c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2710_c22_cb4b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2710_c22_cb4b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2710_c32_eb30_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2710_c22_cb4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2703_c7_018a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output := result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2703_c7_018a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2700_c7_5f08] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output := result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;

     -- n16_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2700_c7_5f08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- n16_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- t16_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2695_c7_eea6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output := result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2695_c7_eea6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2692_c7_ffff] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output := result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- n16_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2692_c7_ffff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2688_c7_f649] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output := result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;

     -- n16_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_f649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2685_c7_9e89] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output := result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- n16_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2685_c7_9e89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2680_c7_65af] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output := result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2680_c7_65af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2677_c7_ab34] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output := result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;

     -- Submodule level 12
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2677_c7_ab34_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2671_c2_4aac] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output := result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2722_l2667_DUPLICATE_9a28 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2722_l2667_DUPLICATE_9a28_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c2_4aac_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2722_l2667_DUPLICATE_9a28_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l2722_l2667_DUPLICATE_9a28_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
