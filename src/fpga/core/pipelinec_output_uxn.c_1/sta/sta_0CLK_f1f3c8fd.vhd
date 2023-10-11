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
-- Submodules: 80
entity sta_0CLK_f1f3c8fd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_f1f3c8fd;
architecture arch of sta_0CLK_f1f3c8fd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_8dc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2496_c1_c93d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_6781]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2496_c2_6781]
signal n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_6781]
signal t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2497_c3_e7fe[uxn_opcodes_h_l2497_c3_e7fe]
signal printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_6137]
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2501_c7_7e52]
signal t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_5515]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2504_c7_fa73]
signal t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2506_c3_50e6]
signal CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_8dc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_f6ad]
signal t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_a4cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_dadc]
signal t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2513_c3_f29a]
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_28e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2516_c7_34fc]
signal n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2519_c11_a505]
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2519_c7_5fed]
signal n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2522_c32_b747]
signal BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2522_c32_b1ef]
signal BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2522_c32_2c7d]
signal MUX_uxn_opcodes_h_l2522_c32_2c7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_2d84]
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_e74b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2527_c7_e74b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2527_c7_e74b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781
result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781
result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- n8_MUX_uxn_opcodes_h_l2496_c2_6781
n8_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_6781
t16_MUX_uxn_opcodes_h_l2496_c2_6781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

-- printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe
printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe : entity work.printf_uxn_opcodes_h_l2497_c3_e7fe_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52
result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52
result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- n8_MUX_uxn_opcodes_h_l2501_c7_7e52
n8_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- t16_MUX_uxn_opcodes_h_l2501_c7_7e52
t16_MUX_uxn_opcodes_h_l2501_c7_7e52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond,
t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue,
t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse,
t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73
result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73
result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- n8_MUX_uxn_opcodes_h_l2504_c7_fa73
n8_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- t16_MUX_uxn_opcodes_h_l2504_c7_fa73
t16_MUX_uxn_opcodes_h_l2504_c7_fa73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond,
t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue,
t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse,
t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6
CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x,
CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- n8_MUX_uxn_opcodes_h_l2509_c7_f6ad
n8_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_f6ad
t16_MUX_uxn_opcodes_h_l2509_c7_f6ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc
result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc
result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- n8_MUX_uxn_opcodes_h_l2512_c7_dadc
n8_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_dadc
t16_MUX_uxn_opcodes_h_l2512_c7_dadc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a
BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- n8_MUX_uxn_opcodes_h_l2516_c7_34fc
n8_MUX_uxn_opcodes_h_l2516_c7_34fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond,
n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue,
n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse,
n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left,
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right,
BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed
result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed
result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- n8_MUX_uxn_opcodes_h_l2519_c7_5fed
n8_MUX_uxn_opcodes_h_l2519_c7_5fed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond,
n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue,
n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse,
n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747
BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left,
BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right,
BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef
BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left,
BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right,
BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output);

-- MUX_uxn_opcodes_h_l2522_c32_2c7d
MUX_uxn_opcodes_h_l2522_c32_2c7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2522_c32_2c7d_cond,
MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue,
MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse,
MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right,
BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b
result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output,
 CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output,
 MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_db83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_bf96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_ac82 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_5a08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_3e0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_4f0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2516_c7_34fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2505_l2513_DUPLICATE_b4e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2534_l2491_DUPLICATE_3502_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_ac82 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_ac82;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_bf96 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_bf96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_3e0d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2514_c3_3e0d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_5a08 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_5a08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_db83 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2498_c3_db83;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_4f0e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2517_c3_4f0e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_a4cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2505_l2513_DUPLICATE_b4e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2505_l2513_DUPLICATE_b4e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_8dc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_8dc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2519_c11_a505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_left;
     BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output := BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2522_c32_b747] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_left;
     BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output := BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_5515] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2516_c11_28e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_6137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_left;
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output := BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2516_c7_34fc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2527_c11_2d84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2522_c32_b747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_8dc3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_6137_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_5515_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_8dc3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_a4cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2516_c11_28e7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2519_c11_a505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c11_2d84_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2505_l2513_DUPLICATE_b4e9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2505_l2513_DUPLICATE_b4e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_9a9b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_4ca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2519_l2516_DUPLICATE_66cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_a683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2527_l2496_l2516_DUPLICATE_54c6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2512_l2509_l2504_l2501_l2496_l2519_l2516_DUPLICATE_c9a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2516_c7_34fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c7_e74b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2522_c32_b1ef] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_left;
     BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output := BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2506_c3_50e6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output := CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2513_c3_f29a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_left;
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output := BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2496_c1_c93d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2527_c7_e74b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2527_c7_e74b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2522_c32_b1ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_f29a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2506_c3_50e6_return_output;
     VAR_printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_c93d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c7_e74b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- MUX[uxn_opcodes_h_l2522_c32_2c7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2522_c32_2c7d_cond <= VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_cond;
     MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue <= VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iftrue;
     MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse <= VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output := MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- printf_uxn_opcodes_h_l2497_c3_e7fe[uxn_opcodes_h_l2497_c3_e7fe] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2497_c3_e7fe_uxn_opcodes_h_l2497_c3_e7fe_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- n8_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue := VAR_MUX_uxn_opcodes_h_l2522_c32_2c7d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2519_c7_5fed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- n8_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2519_c7_5fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2516_c7_34fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;

     -- n8_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2516_c7_34fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- n8_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_dadc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_dadc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_f6ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- n8_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_f6ad_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- n8_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_fa73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_fa73_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_7e52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_7e52_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_6781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2534_l2491_DUPLICATE_3502 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2534_l2491_DUPLICATE_3502_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2496_c2_6781_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_6781_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2534_l2491_DUPLICATE_3502_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2534_l2491_DUPLICATE_3502_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
