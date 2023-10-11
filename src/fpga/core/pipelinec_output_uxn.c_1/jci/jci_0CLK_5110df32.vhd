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
-- Submodules: 69
entity jci_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_5110df32;
architecture arch of jci_0CLK_5110df32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l66_c6_2351]
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l66_c1_28a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l66_c2_6c36]
signal t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l66_c2_6c36]
signal result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l66_c2_6c36]
signal tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l67_c3_27d7[uxn_opcodes_h_l67_c3_27d7]
signal printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l71_c11_7074]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c7_c9e4]
signal tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l74_c11_7108]
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l74_c7_082f]
signal t8_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l74_c7_082f]
signal result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l74_c7_082f]
signal tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l80_c11_1e44]
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_2394]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_2394]
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l80_c7_2394]
signal result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_2394]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l80_c7_2394]
signal result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l80_c7_2394]
signal tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l84_c11_f313]
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_d1c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l84_c7_d1c7]
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_d1c7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l84_c7_d1c7]
signal result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l84_c7_d1c7]
signal tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l86_c3_7d9f]
signal CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l87_c21_94dc]
signal BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_e41b]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_c5b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_c5b4]
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_c5b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l89_c7_c5b4]
signal result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_c5b4]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l90_c21_029a]
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l92_c11_ab52]
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l92_c7_5b27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l92_c7_5b27]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l92_c7_5b27]
signal result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l92_c7_5b27]
signal tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l93_c3_adc7]
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l95_c15_a2dd]
signal BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c25_0479]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c35_2020]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c35_aa44]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l95_c15_2348]
signal MUX_uxn_opcodes_h_l95_c15_2348_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l95_c15_2348_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l95_c15_2348_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l95_c15_2348_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c11_e18d]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_4f38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_4f38]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.ram_addr := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.pc := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351
BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left,
BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right,
BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output);

-- t8_MUX_uxn_opcodes_h_l66_c2_6c36
t8_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36
result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36
result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36
result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- result_pc_MUX_uxn_opcodes_h_l66_c2_6c36
result_pc_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- tmp16_MUX_uxn_opcodes_h_l66_c2_6c36
tmp16_MUX_uxn_opcodes_h_l66_c2_6c36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond,
tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue,
tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse,
tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

-- printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7
printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7 : entity work.printf_uxn_opcodes_h_l67_c3_27d7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074
BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c7_c9e4
t8_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4
result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4
result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4
result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4
tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond,
tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108
BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left,
BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right,
BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output);

-- t8_MUX_uxn_opcodes_h_l74_c7_082f
t8_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l74_c7_082f_cond,
t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l74_c7_082f
result_pc_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond,
result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l74_c7_082f
tmp16_MUX_uxn_opcodes_h_l74_c7_082f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond,
tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue,
tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse,
tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44
BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394
result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond,
result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- result_pc_MUX_uxn_opcodes_h_l80_c7_2394
result_pc_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond,
result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- tmp16_MUX_uxn_opcodes_h_l80_c7_2394
tmp16_MUX_uxn_opcodes_h_l80_c7_2394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond,
tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue,
tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse,
tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313
BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7
result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond,
result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue,
result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse,
result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7
tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond,
tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f
CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x,
CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc
BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left,
BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right,
BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b
BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4
result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond,
result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue,
result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse,
result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4
tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a
BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left,
BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right,
BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52
BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left,
BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right,
BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output);

-- result_pc_MUX_uxn_opcodes_h_l92_c7_5b27
result_pc_MUX_uxn_opcodes_h_l92_c7_5b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond,
result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue,
result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse,
result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l92_c7_5b27
tmp16_MUX_uxn_opcodes_h_l92_c7_5b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond,
tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue,
tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse,
tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7
BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left,
BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right,
BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd
BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left,
BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right,
BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479
BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output);

-- MUX_uxn_opcodes_h_l95_c15_2348
MUX_uxn_opcodes_h_l95_c15_2348 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l95_c15_2348_cond,
MUX_uxn_opcodes_h_l95_c15_2348_iftrue,
MUX_uxn_opcodes_h_l95_c15_2348_iffalse,
MUX_uxn_opcodes_h_l95_c15_2348_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d
BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output,
 t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output,
 t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output,
 t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output,
 result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output,
 CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output,
 result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output,
 result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output,
 tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output,
 BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output,
 MUX_uxn_opcodes_h_l95_c15_2348_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l68_c3_b4d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l72_c3_f485 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l71_c7_c9e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l77_c3_e47c : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l87_c3_92c9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l90_c3_7873 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c15_2348_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c15_2348_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c15_2348_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c15_2348_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l85_l93_DUPLICATE_9bdd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a_uxn_opcodes_h_l102_l61_DUPLICATE_da75_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l72_c3_f485 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l72_c3_f485;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l68_c3_b4d8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l68_c3_b4d8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l77_c3_e47c := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l77_c3_e47c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse := tmp16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l71_c7_c9e4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l95_c15_a2dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l90_c21_029a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l92_c11_ab52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_left;
     BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output := BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l66_c6_2351] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_left;
     BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output := BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c11_e18d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l84_c11_f313] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_left;
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output := BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c11_7074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l87_c21_94dc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_e41b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l80_c11_1e44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_left;
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output := BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l74_c11_7108] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_left;
     BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output := BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c25_0479] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l85_l93_DUPLICATE_9bdd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l85_l93_DUPLICATE_9bdd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l66_c6_2351_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c11_7074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l74_c11_7108_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_1e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_f313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_e41b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_ab52_return_output;
     VAR_MUX_uxn_opcodes_h_l95_c15_2348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c15_a2dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_e18d_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l87_c3_92c9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l87_c21_94dc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l90_c3_7873 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l90_c21_029a_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l95_c15_2348_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c25_0479_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l85_l93_DUPLICATE_9bdd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l85_l93_DUPLICATE_9bdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l66_l71_l74_DUPLICATE_81ec_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l66_l92_l89_l84_l80_l74_l71_DUPLICATE_9f07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l66_l71_l89_DUPLICATE_c5f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l92_l89_l84_l80_l74_l71_l97_DUPLICATE_16de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l66_l89_l84_l80_l74_l71_l97_DUPLICATE_bb2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l66_l80_l71_DUPLICATE_8710_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l87_c3_92c9;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l90_c3_7873;
     -- t8_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output := t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_4f38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l86_c3_7d9f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output := CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l89_c7_c5b4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l66_c1_28a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_4f38] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l93_c3_adc7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_left;
     BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output := BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right := VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_adc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l86_c3_7d9f_return_output;
     VAR_printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l66_c1_28a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_4f38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_4f38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l92_c7_5b27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l92_c7_5b27] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_cond;
     tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue;
     tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output := tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l92_c7_5b27] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c35_2020] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output;

     -- printf_uxn_opcodes_h_l67_c3_27d7[uxn_opcodes_h_l67_c3_27d7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l67_c3_27d7_uxn_opcodes_h_l67_c3_27d7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l84_c7_d1c7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_2020_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_t8_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;
     -- t8_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_c5b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_c5b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c35_aa44] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_c5b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output := result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l95_c15_2348_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c35_aa44_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;
     -- MUX[uxn_opcodes_h_l95_c15_2348] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l95_c15_2348_cond <= VAR_MUX_uxn_opcodes_h_l95_c15_2348_cond;
     MUX_uxn_opcodes_h_l95_c15_2348_iftrue <= VAR_MUX_uxn_opcodes_h_l95_c15_2348_iftrue;
     MUX_uxn_opcodes_h_l95_c15_2348_iffalse <= VAR_MUX_uxn_opcodes_h_l95_c15_2348_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l95_c15_2348_return_output := MUX_uxn_opcodes_h_l95_c15_2348_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_d1c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l84_c7_d1c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_cond;
     tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output := tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_d1c7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;

     -- Submodule level 5
     VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue := VAR_MUX_uxn_opcodes_h_l95_c15_2348_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l92_c7_5b27] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_cond;
     result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iftrue;
     result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output := result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output := tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l92_c7_5b27_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l89_c7_c5b4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_cond;
     result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output := result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output := tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l89_c7_c5b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l84_c7_d1c7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_cond;
     result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output := result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l84_c7_d1c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l80_c7_2394] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_cond;
     result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iftrue;
     result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output := result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l80_c7_2394_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l74_c7_082f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_cond;
     result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output := result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l74_c7_082f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l71_c7_c9e4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_cond;
     result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output := result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l71_c7_c9e4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l66_c2_6c36] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_cond;
     result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iftrue;
     result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output := result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a_uxn_opcodes_h_l102_l61_DUPLICATE_da75 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a_uxn_opcodes_h_l102_l61_DUPLICATE_da75_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l66_c2_6c36_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l66_c2_6c36_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a_uxn_opcodes_h_l102_l61_DUPLICATE_da75_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3a4a_uxn_opcodes_h_l102_l61_DUPLICATE_da75_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
