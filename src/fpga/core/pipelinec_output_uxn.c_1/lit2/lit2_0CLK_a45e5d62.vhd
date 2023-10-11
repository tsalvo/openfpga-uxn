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
-- Submodules: 68
entity lit2_0CLK_a45e5d62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_a45e5d62;
architecture arch of lit2_0CLK_a45e5d62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l223_c6_78e4]
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_67b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l223_c2_0716]
signal tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_0716]
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l224_c3_46ad[uxn_opcodes_h_l224_c3_46ad]
signal printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l230_c11_a90a]
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l230_c7_5c51]
signal tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_5c51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l234_c11_b366]
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l234_c7_5bfc]
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l236_c3_9cf6]
signal CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l237_c21_9f99]
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l239_c11_5b88]
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l239_c7_3836]
signal tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l239_c7_3836]
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c21_ade0]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_1714]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_30b6]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_30b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l243_c3_74c6]
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l245_c15_4b88]
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l250_c11_ecd7]
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_e3de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_e3de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_e3de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l250_c7_e3de]
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_e3de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l253_c34_f73b]
signal CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l255_c11_fcbf]
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_6544]
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_6544]
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_0f75( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.pc := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4
BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l223_c2_0716
tmp16_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond,
tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716
result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_pc_MUX_uxn_opcodes_h_l223_c2_0716
result_pc_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

-- printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad
printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad : entity work.printf_uxn_opcodes_h_l224_c3_46ad_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a
BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l230_c7_5c51
tmp16_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51
result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_pc_MUX_uxn_opcodes_h_l230_c7_5c51
result_pc_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366
BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output);

-- tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc
tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc
result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc
result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6
CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x,
CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left,
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right,
BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88
BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output);

-- tmp16_MUX_uxn_opcodes_h_l239_c7_3836
tmp16_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond,
tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_pc_MUX_uxn_opcodes_h_l239_c7_3836
result_pc_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836
result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714
BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_30b6
tmp16_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l242_c7_30b6
result_pc_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6
result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6
BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left,
BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right,
BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left,
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right,
BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de
result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output);

-- CONST_SR_8_uxn_opcodes_h_l253_c34_f73b
CONST_SR_8_uxn_opcodes_h_l253_c34_f73b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x,
CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf
BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output,
 tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output,
 tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output,
 CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output,
 tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output,
 CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_962d : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_0716_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_5c51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l237_c3_00fb : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l240_c3_faf3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_3836_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l245_c3_8b37 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_aa77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_fd50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_bc9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_4a1a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_538d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l260_l218_DUPLICATE_201a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_bc9c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_bc9c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_aa77 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_aa77;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_962d := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_962d;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l234_c11_b366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_left;
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output := BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l255_c11_fcbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l230_c11_a90a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_left;
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output := BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output := result.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l223_c6_78e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_538d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_538d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_0716_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l250_c11_ecd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c21_ade0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_3836_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l237_c21_9f99] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_left;
     BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output := BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l239_c11_5b88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_left;
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output := BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_1714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l245_c15_4b88] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_left;
     BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output := BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l253_c34_f73b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output := CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output := result.stack_address_sp_offset;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_5c51_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_78e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_a90a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_b366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_5b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_1714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ecd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_fcbf_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l237_c3_00fb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c21_9f99_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l240_c3_faf3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c21_ade0_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l245_c3_8b37 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c15_4b88_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_538d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_538d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l239_l234_l230_l223_l242_DUPLICATE_1f07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_6ae4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_be1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_0868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_438a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_62a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_0716_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := VAR_result_pc_uxn_opcodes_h_l245_c3_8b37;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l237_c3_00fb;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l240_c3_faf3;
     -- result_ram_addr_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_67b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l253_c24_4a1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_4a1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c34_f73b_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_6544] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_6544] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_e3de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l236_c3_9cf6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output := CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_e3de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l243_c3_74c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_left;
     BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output := BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c24_4a1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_9cf6_return_output;
     VAR_printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_67b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_6544_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_6544_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_e3de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l248_c24_fd50] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_fd50_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_74c6_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l250_c7_e3de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output := result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_e3de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;

     -- printf_uxn_opcodes_h_l224_c3_46ad[uxn_opcodes_h_l224_c3_46ad] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l224_c3_46ad_uxn_opcodes_h_l224_c3_46ad_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c24_fd50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l250_c7_e3de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l242_c7_30b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output := tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l242_c7_30b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_3836] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l239_c7_3836_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l234_c7_5bfc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output := result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l234_c7_5bfc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output := tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l230_c7_5c51] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_cond;
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output := result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l230_c7_5c51_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_0716_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l223_c2_0716] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_cond;
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output := result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l260_l218_DUPLICATE_201a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l260_l218_DUPLICATE_201a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0f75(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_0716_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_0716_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l260_l218_DUPLICATE_201a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l260_l218_DUPLICATE_201a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
