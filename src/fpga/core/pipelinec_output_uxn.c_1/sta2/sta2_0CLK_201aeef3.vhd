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
-- Submodules: 122
entity sta2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_201aeef3;
architecture arch of sta2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2238_c6_29ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2238_c1_4d55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2238_c2_b64e]
signal t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2239_c3_22d3[uxn_opcodes_h_l2239_c3_22d3]
signal printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_fda1]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2244_c7_1320]
signal n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2244_c7_1320]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2244_c7_1320]
signal t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_6907]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2247_c7_a670]
signal n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_a670]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2247_c7_a670]
signal t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_8160]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c7_0057]
signal n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c7_0057]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2252_c7_0057]
signal t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_bfda]
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2255_c7_8ae7]
signal t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2256_c3_7a0a]
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2259_c11_5a99]
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2259_c7_fcb0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_1779]
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2262_c7_8234]
signal n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2262_c7_8234]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_06d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2267_c7_1a74]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2270_c11_a29f]
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2270_c7_835d]
signal n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c7_835d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2271_c3_4a16]
signal BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2274_c32_81d3]
signal BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2274_c32_bf61]
signal BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2274_c32_2a03]
signal MUX_uxn_opcodes_h_l2274_c32_2a03_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2274_c32_2a03_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_b6dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2276_c7_1374]
signal result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2276_c7_1374]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2276_c7_1374]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2276_c7_1374]
signal result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_1374]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2280_c32_10b4]
signal CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_dba9]
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2282_c7_de3f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2282_c7_de3f]
signal result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2282_c7_de3f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_de3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2284_c21_2194]
signal BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_3fc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2287_c7_61bc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_61bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7563( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae
BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output);

-- n16_MUX_uxn_opcodes_h_l2238_c2_b64e
n16_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e
result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e
result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e
result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e
result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e
result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e
result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- t16_MUX_uxn_opcodes_h_l2238_c2_b64e
t16_MUX_uxn_opcodes_h_l2238_c2_b64e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond,
t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue,
t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse,
t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

-- printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3
printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3 : entity work.printf_uxn_opcodes_h_l2239_c3_22d3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output);

-- n16_MUX_uxn_opcodes_h_l2244_c7_1320
n16_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320
result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320
result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320
result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320
result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- t16_MUX_uxn_opcodes_h_l2244_c7_1320
t16_MUX_uxn_opcodes_h_l2244_c7_1320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond,
t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue,
t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse,
t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output);

-- n16_MUX_uxn_opcodes_h_l2247_c7_a670
n16_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670
result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670
result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- t16_MUX_uxn_opcodes_h_l2247_c7_a670
t16_MUX_uxn_opcodes_h_l2247_c7_a670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond,
t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue,
t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse,
t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c7_0057
n16_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057
result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057
result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- t16_MUX_uxn_opcodes_h_l2252_c7_0057
t16_MUX_uxn_opcodes_h_l2252_c7_0057 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond,
t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue,
t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse,
t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output);

-- n16_MUX_uxn_opcodes_h_l2255_c7_8ae7
n16_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7
result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- t16_MUX_uxn_opcodes_h_l2255_c7_8ae7
t16_MUX_uxn_opcodes_h_l2255_c7_8ae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond,
t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue,
t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse,
t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a
BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left,
BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right,
BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left,
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right,
BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output);

-- n16_MUX_uxn_opcodes_h_l2259_c7_fcb0
n16_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0
result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output);

-- n16_MUX_uxn_opcodes_h_l2262_c7_8234
n16_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234
result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234
result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234
result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234
result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234
result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234
result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_1a74
n16_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74
result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74
result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74
result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left,
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right,
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output);

-- n16_MUX_uxn_opcodes_h_l2270_c7_835d
n16_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d
result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d
result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d
result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16
BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left,
BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right,
BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3
BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left,
BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right,
BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61
BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left,
BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right,
BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output);

-- MUX_uxn_opcodes_h_l2274_c32_2a03
MUX_uxn_opcodes_h_l2274_c32_2a03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2274_c32_2a03_cond,
MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue,
MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse,
MUX_uxn_opcodes_h_l2274_c32_2a03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374
result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374
result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374
result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374
result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond,
result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4
CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x,
CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f
result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f
result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f
result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194
BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left,
BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right,
BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc
result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output,
 n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output,
 n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output,
 n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output,
 n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output,
 n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output,
 n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output,
 n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output,
 MUX_uxn_opcodes_h_l2274_c32_2a03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output,
 CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2241_c3_3b6b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_8b9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_41ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_bf5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2257_c3_aa8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2260_c3_bb10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e2f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_2e09 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2267_c7_1a74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2280_c22_1f78_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2284_c3_c821 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2285_c22_9ff0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2234_l2292_DUPLICATE_2d0f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2241_c3_3b6b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2241_c3_3b6b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2260_c3_bb10 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2260_c3_bb10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2257_c3_aa8c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2257_c3_aa8c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e2f4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e2f4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_bf5a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_bf5a;
     VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_8b9d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2245_c3_8b9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_41ee := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_41ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_2e09 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_2e09;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_6907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2270_c11_a29f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2274_c32_81d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_left;
     BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output := BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output := result.ram_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_b6dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2259_c11_5a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_3fc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_06d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_dba9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2267_c7_1a74_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_1779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_left;
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output := BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_fda1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2238_c6_29ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_8160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2280_c32_10b4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output := CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2285_c22_9ff0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2285_c22_9ff0_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_bfda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2284_c21_2194] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2274_c32_81d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2238_c6_29ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_fda1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_6907_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_8160_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_bfda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2259_c11_5a99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_1779_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_06d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_a29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b6dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_dba9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_3fc5_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2284_c3_c821 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2284_c21_2194_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2263_l2271_l2248_l2256_DUPLICATE_7993_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2285_c22_9ff0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_da03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_ad20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2287_l2255_l2282_l2252_l2276_l2247_l2270_DUPLICATE_a23a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2287_l2255_l2252_l2247_l2270_DUPLICATE_16bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2252_l2276_l2247_DUPLICATE_3dfa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2244_l2267_l2262_l2259_l2255_l2252_l2247_l2270_DUPLICATE_43c1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2244_l2267_l2238_l2262_l2259_l2255_l2282_l2252_l2247_l2270_DUPLICATE_cda8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2284_c3_c821;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2287_c7_61bc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_61bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2238_c1_4d55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2282_c7_de3f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2280_c22_1f78] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2280_c22_1f78_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2280_c32_10b4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2256_c3_7a0a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_left;
     BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output := BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2274_c32_bf61] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_left;
     BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output := BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2282_c7_de3f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2271_c3_4a16] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_left;
     BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output := BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2276_c7_1374] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2274_c32_bf61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2256_c3_7a0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2271_c3_4a16_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2280_c22_1f78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2249_l2264_DUPLICATE_e7a6_return_output;
     VAR_printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2238_c1_4d55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2287_c7_61bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2282_c7_de3f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;

     -- printf_uxn_opcodes_h_l2239_c3_22d3[uxn_opcodes_h_l2239_c3_22d3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2239_c3_22d3_uxn_opcodes_h_l2239_c3_22d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2274_c32_2a03] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2274_c32_2a03_cond <= VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_cond;
     MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue <= VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iftrue;
     MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse <= VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_return_output := MUX_uxn_opcodes_h_l2274_c32_2a03_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_de3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2276_c7_1374] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;

     -- n16_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2276_c7_1374] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output := result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue := VAR_MUX_uxn_opcodes_h_l2274_c32_2a03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2282_c7_de3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_1374] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2276_c7_1374] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- t16_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2276_c7_1374_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2270_c7_835d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- n16_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2270_c7_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2267_c7_1a74] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2267_c7_1a74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2262_c7_8234] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;

     -- n16_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2262_c7_8234_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2259_c7_fcb0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2259_c7_fcb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- n16_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_8ae7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2255_c7_8ae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     -- n16_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_0057] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c7_0057_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- n16_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_a670] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_a670_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2244_c7_1320] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2244_c7_1320_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2238_c2_b64e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2234_l2292_DUPLICATE_2d0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2234_l2292_DUPLICATE_2d0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7563(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2238_c2_b64e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2234_l2292_DUPLICATE_2d0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7563_uxn_opcodes_h_l2234_l2292_DUPLICATE_2d0f_return_output;
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
